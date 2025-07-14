module "glpi-subnet" {
  source              = "github.com/rafikbahri/tf-aws-private-subnet"
  name                = "glpi-subnet"
  vpc_id              = module.main-vpc.vpc_id
  availability_zone   = "eu-west-3a"
  cidr_block          = var.glpi_subnet_cidr
  public_subnet_id    = module.bastions-subnet.subnet_id
  has_internet_access = true
  tags = {
    kind  = "private"
    group = "glpi"
  }
}

module "glpi-cluster" {
  source          = "github.com/rafikbahri/tf-aws-node"
  server_count    = var.glpi_cluster_servers_count
  server_prefix   = "glpi"
  ami_id          = "ami-0546127e0cf2c6498"
  instance_type   = "t2.micro"
  vpc_id          = module.main-vpc.vpc_id
  subnet_id       = module.glpi-subnet.subnet_id
  private_ips     = [["10.0.16.11"]]
  create_key      = false
  security_groups = [module.sg-admin.sg_id]
  user_data_file  = ".config/cloudinit_user_data.yaml"
  tags = {
    component = "glpi"
    tier      = "infra"
  }
}