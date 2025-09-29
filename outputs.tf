output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = module.bastion.bastion_public_ip
}

output "bastion_public_dns" {
  description = "Public DNS of bastion host"
  value       = module.bastion.bastion_public_dns
}

output "glpi_private_ip" {
  description = "Private IP of GLPI instance"
  value       = module.glpi.glpi_private_ip
}

output "ssh_commands" {
  description = "SSH commands to access instances"
  value = {
    bastion   = "ssh -F .ssh/config bastion001"
    glpi_jump = "ssh -F .ssh/config glpi001"
  }
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.bastion.bastion_public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.glpi.glpi_private_subnet_id
}

output "ami_id" {
  description = "AMI ID used for the EC2 instances"
  value       = data.aws_ami.ubuntu.id
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.glpi_alb.dns_name
}

output "glpi_db_address" {
  description = "Hostname of the GLPI RDS database"
  value       = module.mysql.rds_endpoint
}