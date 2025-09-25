resource "local_file" "ssh_config" {
  content = templatefile("${path.module}/ssh_config.tpl", {
    bastion_public_ip_1 = module.bastion.bastion_public_ip
    glpi_private_1      = module.glpi.glpi_private_ip
    ssh_key_path        = "~/.ssh/id_ed25519_bastion"
  })
  filename = pathexpand("${path.module}/.ssh/config")

  file_permission = "0600"
}
