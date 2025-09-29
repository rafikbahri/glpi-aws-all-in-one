resource "aws_subnet" "public_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.alb_subnet_1_cidr
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "alb-public-subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.alb_subnet_2_cidr
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "alb-public-subnet-2"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = var.bastion_public_route_table_id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = var.bastion_public_route_table_id
}

resource "aws_security_group" "glpi_alb_sg" {
  name        = "glpi-alb-sg"
  description = "Security group for GLPI ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "glpi-alb-sg"
  }
}

resource "aws_security_group_rule" "allow_http_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.glpi_alb_sg.id
  security_group_id        = var.glpi_ec2_security_group_id
  description              = "HTTP from ALB"
}

resource "aws_security_group_rule" "allow_https_from_alb" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.glpi_alb_sg.id
  security_group_id        = var.glpi_ec2_security_group_id
  description              = "HTTPS from ALB"
}

resource "aws_lb_target_group" "glpi_tg" {
  name     = "glpi-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/index.php"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200-399"
  }

  tags = {
    Name = "glpi-target-group"
  }
}

resource "aws_lb_target_group_attachment" "glpi_tg_attachment" {
  target_group_arn = aws_lb_target_group.glpi_tg.arn
  target_id        = var.glpi_ec2_instance_id
  port             = 80
}

resource "aws_lb" "glpi_alb" {
  name               = "glpi-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.glpi_alb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  enable_deletion_protection = false

  tags = {
    Name = "glpi-alb"
  }
}

resource "tls_private_key" "alb_cert" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "alb_cert" {
  private_key_pem = tls_private_key.alb_cert.private_key_pem

  subject {
    common_name  = aws_lb.glpi_alb.dns_name
    organization = "Test GLPI Organization"
  }

  dns_names = [
    aws_lb.glpi_alb.dns_name,
    "*.${aws_lb.glpi_alb.dns_name}"
  ]

  validity_period_hours = 8760 # 1 year

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  depends_on = [aws_lb.glpi_alb]
}

# Import certificate to ACM
resource "aws_acm_certificate" "alb_cert" {
  private_key      = tls_private_key.alb_cert.private_key_pem
  certificate_body = tls_self_signed_cert.alb_cert.cert_pem

  tags = {
    Name = "alb-self-signed-cert"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [tls_self_signed_cert.alb_cert]
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.glpi_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.alb_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.glpi_tg.arn
  }

  tags = {
    Name = "https-listener"
  }

  depends_on = [aws_acm_certificate.alb_cert]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.glpi_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}