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
