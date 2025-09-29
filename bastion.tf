module "bastion" {
  source = "./infra/modules/bastion"

  vpc_id               = module.network.vpc_id
  bastions_subnet_cidr = var.bastions_subnet_cidr
  availability_zone    = data.aws_availability_zones.available.names[0]
  internet_gateway_id  = module.network.internet_gateway_id
  allowed_cidr_blocks  = var.allowed_cidr_blocks
  ami_id               = data.aws_ami.ubuntu.id
  instance_type        = "t3.micro"
}

