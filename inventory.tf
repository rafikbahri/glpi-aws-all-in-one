resource "local_file" "inventory" {
  filename        = "inventory/${var.platform}"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
[${var.platform}:children]
bastions
glpi

[bastions]
%{for index in range(length(module.bastions.hostnames))~}
${element(module.bastions.hostnames, index)}
%{endfor~}

[glpi]
%{for index in range(length(module.glpi-cluster.hostnames))~}
${element(module.glpi-cluster.hostnames, index)}
%{endfor~}
EOT
}

resource "local_file" "etchosts" {
  filename        = "inventory/group_vars/${var.platform}/hosts.yml"
  file_permission = "0644"
  content         = <<EOT
# Terraform managed
---
etc_hosts:
%{for index in range(length(module.bastions.hostnames))~}
  - ip: ${element(module.bastions.private_ips, index)}
    names:
      - ${element(module.bastions.hostnames, index)}
      - ${element(module.bastions.hostnames, index)}.${var.platform}
%{endfor~}
%{for index in range(length(module.glpi-cluster.hostnames))~}
  - ip: ${element(module.glpi-cluster.private_ips, index)}
    names:
      - ${element(module.glpi-cluster.hostnames, index)}
      - ${element(module.glpi-cluster.hostnames, index)}.${var.platform}
%{endfor~}
EOT
}
