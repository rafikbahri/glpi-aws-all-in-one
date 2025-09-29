module "network" {
  source = "./infra/modules/network"

  vpc_cidr = var.vpc_cidr
  bastion_public_subnet_id = module.bastion.bastion_public_subnet_id
}