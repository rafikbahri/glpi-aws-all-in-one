
resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.bastions_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "bastion-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "bastion-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from allowed CIDR blocks"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.bastion.id]
  subnet_id              = aws_subnet.public.id

  user_data = <<-EOF
              #!/bin/bash
              apt update && apt upgrade -y
              echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFb4AloR5UZKuVKDDjVlAeMxj+A9e0Pkw6XU/izk6kP/ rbahri@Rafiks-MacBook-Pro.local" >> /home/ubuntu/.ssh/authorized_keys
              # Configure SSH for agent forwarding
              echo "AllowAgentForwarding yes" >> /etc/ssh/sshd_config
              systemctl restart ssh
              EOF

  tags = {
    Name = "bastion001"
  }
}