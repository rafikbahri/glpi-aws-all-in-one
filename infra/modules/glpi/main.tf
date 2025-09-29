resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.glpi_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "glpi-subnet"
  }
}

# Route Table for Private Subnet (no internet access)
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "glpi-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "private" {
  name        = "private-sg"
  description = "Security group for private instances"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH from bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = var.ssh_from_security_groups_ids
  }

  ingress {
    description = "All traffic from private subnet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.glpi_subnet_cidr]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

resource "aws_security_group" "glpi_ec2_sg" {
  name        = "glpi-ec2-sg"
  description = "Security group for GLPI instance HTTP and HTTPS access"
  vpc_id      = var.vpc_id

  tags = {
    Name = "glpi-ec2-sg"
  }
}

resource "aws_instance" "glpi_instance" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.private.id, aws_security_group.glpi_ec2_sg.id]
  subnet_id              = aws_subnet.private.id

  user_data = <<-EOF
              #!/bin/bash
              apt update && apt upgrade -y
              echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAX9ivVQE6SkCDD43QPd4ek3GUcKxfbhlOCbUOaP9NGk rafik-bahri-personal" >> /home/ubuntu/.ssh/authorized_keys
              EOF

  tags = {
    Name = "glpi001"
  }
}
