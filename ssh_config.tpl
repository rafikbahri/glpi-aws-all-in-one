# Managed by Terraform

Host bastion001
    HostName ${bastion_public_ip_1}
    User ubuntu
    IdentityFile ${ssh_key_path}
    ForwardAgent yes
    ServerAliveInterval 60
    ServerAliveCountMax 3
    StrictHostKeyChecking accept-new

Host glpi001
    HostName ${glpi_private_1}
    User ubuntu
    IdentityFile ${ssh_key_path}
    ProxyJump bastion001
    ServerAliveInterval 60
    ServerAliveCountMax 3
    StrictHostKeyChecking accept-new
