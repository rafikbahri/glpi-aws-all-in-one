output "public_ip" {
  description = "Public IP of the created EC2 instance"
  value       = module.bastions.public_ip
}

output "bastions_private_ips" {
  description = "Private IPs of the bastion servers"
  value       = module.bastions.private_ips
}

output "private_key" {
  description = "Private key for SSH access to the bastion servers"
  value       = var.create_key ? module.bastions.private_key : null
  sensitive   = true
}

output "ssh_command" {
  description = "SSH command to connect to the bastion servers"
  value       = "ssh -i ~/.ssh/id_ed25519_bastion ec2-user@${module.bastions.public_ip[0]}"
}