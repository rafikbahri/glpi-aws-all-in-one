module "glpi" {
  source = "./infra/modules/glpi"

  vpc_id                       = module.network.vpc_id
  nat_gateway_id               = module.network.nat_gateway_id
  ssh_from_security_groups_ids = [module.bastion.bastion_security_group_id]
  ami_id                       = data.aws_ami.ubuntu.id
  glpi_subnet_cidr             = var.glpi_subnet_cidr
  availability_zone            = data.aws_availability_zones.available.names[0]
}
