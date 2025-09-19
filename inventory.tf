resource "local_file" "inventory" {
  filename        = "inventory/${var.platform}"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
[${var.platform}:children]
bastions
glpi

[bastions]
${aws_instance.bastion.tags.Name}

[glpi]
${aws_instance.glpi_instance.tags.Name}
EOT
}

resource "local_file" "etchosts" {
  filename        = "inventory/group_vars/${var.platform}/hosts.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
etc_hosts:
  - ip: ${aws_instance.bastion.private_ip}
    names:
      - ${aws_instance.bastion.tags.Name}
      - ${aws_instance.bastion.tags.Name}.${var.platform}
  - ip: ${aws_instance.glpi_instance.private_ip}
    names:
      - ${aws_instance.glpi_instance.tags.Name}
      - ${aws_instance.glpi_instance.tags.Name}.${var.platform}
EOT
}

resource "local_file" "glpi_domain_config" {
  filename        = "inventory/group_vars/glpi/domain.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
glpi_domain: "${aws_lb.glpi_alb.dns_name}"
glpi_url: "https://${aws_lb.glpi_alb.dns_name}"
EOT
}

resource "local_file" "glpi_db_config" {
  filename        = "inventory/group_vars/glpi/db.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
glpi_db_host: "${aws_db_instance.glpi_db.address}"
glpi_db_port: "${aws_db_instance.glpi_db.port}"
glpi_db_name: "${var.glpi_db_name}"
glpi_db_user: "${var.glpi_db_username}"
glpi_db_password: "${var.glpi_db_password}"
EOT
}