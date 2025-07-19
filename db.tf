resource "aws_subnet" "glpi_db_private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "glpi-db-private-subnet-1"
  }
}

resource "aws_subnet" "glpi_db_private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "glpi-db-private-subnet-2"
  }
}

resource "aws_db_subnet_group" "glpi_db_subnet_group" {
  name       = "glpi-db-subnet-group"
  subnet_ids = [aws_subnet.glpi_db_private_subnet_1.id, aws_subnet.glpi_db_private_subnet_2.id]

  tags = {
    Name = "GLPI DB Subnet Group"
  }
}

resource "aws_security_group" "glpi_rds_sg" {
  name        = "glpi-rds-sg"
  description = "Security group for GLPI RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.glpi_ec2_sg.id]
  }

  tags = {
    Name = "glpi-rds-sg"
  }
}

resource "aws_db_instance" "glpi_db" {
  allocated_storage      = 20
  max_allocated_storage  = 100
  storage_type           = "gp3"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.medium"
  identifier             = "glpi-db"
  db_name                = "glpi"
  username               = var.glpi_db_username
  password               = var.glpi_db_password
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.glpi_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.glpi_rds_sg.id]
  multi_az               = true
  skip_final_snapshot    = true

  tags = {
    Name = "glpi-db"
  }
}
