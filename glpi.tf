resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.glpi_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "glpi-subnet"
  }
}

# Route Table for Private Subnet (no internet access)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
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
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
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


resource "aws_instance" "glpi_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id # Problematic "ami-00983e8a26e4c9bd9" # Ubuntu 22.04 LTS in eu-west-3
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.bastion.key_name
  vpc_security_group_ids = [aws_security_group.private.id]
  subnet_id              = aws_subnet.private.id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              EOF

  tags = {
    Name = "glpi001"
  }
}
