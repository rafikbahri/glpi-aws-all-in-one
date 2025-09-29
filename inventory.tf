resource "local_file" "inventory" {
  filename        = "inventory/${var.platform}"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
[${var.platform}:children]
bastions
glpi

[bastions]
${module.bastion.bastion_instance_tags.Name}

[glpi]
${module.glpi.glpi_instance_tags.Name}
EOT
}

resource "local_file" "etchosts" {
  filename        = "inventory/group_vars/${var.platform}/hosts.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
etc_hosts:
  - ip: ${module.bastion.bastion_private_ip}
    names:
      - ${module.bastion.bastion_instance_tags.Name}
      - ${module.bastion.bastion_instance_tags.Name}.${var.platform}
  - ip: ${module.glpi.glpi_private_ip}
    names:
      - ${module.glpi.glpi_instance_tags.Name}
      - ${module.glpi.glpi_instance_tags.Name}.${var.platform}
EOT
}

resource "local_file" "glpi_domain_config" {
  filename        = "inventory/group_vars/glpi/domain.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
glpi_domain: "${module.alb.alb_dns_name}"
glpi_url: "https://${module.alb.alb_dns_name}"
EOT
}

resource "local_file" "glpi_db_config" {
  filename        = "inventory/group_vars/glpi/db.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
glpi_db_host: "${module.mysql.rds_endpoint}"
glpi_db_port: "${module.mysql.rds_port}"
glpi_db_name: "${module.mysql.db_name}"
glpi_db_user: "${module.mysql.username}"
glpi_db_password: "${var.glpi_db_password}"
EOT
}