module "alb" {
  source = "./infra/modules/alb"

  vpc_id = aws_vpc.main.id
  alb_subnet_1_cidr = var.alb_subnet_1_cidr
  alb_subnet_2_cidr = var.alb_subnet_2_cidr
  bastion_public_route_table_id = module.bastion.bastion_public_route_table_id
  glpi_ec2_security_group_id = module.glpi.glpi_ec2_security_group_id
  glpi_ec2_instance_id = module.glpi.glpi_instance_id
  availability_zones = data.aws_availability_zones.available.names

}