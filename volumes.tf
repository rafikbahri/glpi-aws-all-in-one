module "storage" {
  source = "./infra/modules/storage"

  availability_zones = data.aws_availability_zones.available.names
  glpi_instance_id = module.glpi.glpi_instance_id
}
