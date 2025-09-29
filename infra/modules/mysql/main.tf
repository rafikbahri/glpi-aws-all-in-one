resource "aws_subnet" "glpi_db_private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_1_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "glpi-db-private-subnet-1"
  }
}

resource "aws_subnet" "glpi_db_private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_2_cidr
  availability_zone = var.availability_zones[1]

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
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.glpi_ec2_security_group_id]
  }

  tags = {
    Name = "glpi-rds-sg"
  }
}

resource "aws_db_instance" "glpi_db" {
  allocated_storage      = var.allocated_storage_size
  max_allocated_storage  = var.storage_auto_scaling_max_size
  storage_type           = var.storage_type
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.medium"
  identifier             = var.identifier
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.glpi_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.glpi_rds_sg.id]
  multi_az               = var.multi_az
  skip_final_snapshot    = true

  tags = {
    Name = var.identifier
  }
}
