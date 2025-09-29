output "glpi_private_ip" {
  description = "The private IP address of the GLPI instance."
  value       = aws_instance.glpi_instance.private_ip
}

output "glpi_private_subnet_id" {
  description = "The ID of the private subnet."
  value       = aws_subnet.private.id
}

output "glpi_ec2_security_group_id" {
  description = "The ID of the GLPI EC2 security group."
  value       = aws_security_group.glpi_ec2_sg.id
}

output "glpi_instance_tags" {
  description = "The tags of the GLPI instance."
  value       = aws_instance.glpi_instance.tags
}

output "glpi_instance_id" {
  description = "The ID of the GLPI instance."
  value       = aws_instance.glpi_instance.id
}