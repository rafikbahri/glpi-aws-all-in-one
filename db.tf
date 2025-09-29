module "mysql" {
  source                        = "./infra/modules/mysql"

  vpc_id                        = aws_vpc.main.id
  availability_zones            = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  glpi_ec2_security_group_id    = module.glpi.glpi_ec2_security_group_id
  db_subnet_1_cidr              = var.db_subnet_1_cidr
  db_subnet_2_cidr              = var.db_subnet_2_cidr
  allocated_storage_size        = var.db_allocated_storage_size
  storage_auto_scaling_max_size = var.db_storage_auto_scaling_max_size
  storage_type                  = var.db_storage_type
  identifier                    = var.glpi_db_identifier
  db_name                       = var.glpi_db_name
  username                      = var.glpi_db_username
  password                      = var.glpi_db_password
  multi_az                      = var.glpi_db_multi_az
}