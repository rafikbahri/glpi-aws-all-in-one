output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  description = "Public DNS of bastion host"
  value       = aws_instance.bastion.public_dns
}

output "bastion_public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "bastion_public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "bastion_security_group_id" {
  description = "ID of the bastion security group"
  value       = aws_security_group.bastion.id
}

output "bastion_private_ip" {
  description = "Private IP of bastion host"
  value       = aws_instance.bastion.private_ip
}

output "bastion_instance_tags" {
  description = "Tags of the bastion instance"
  value       = aws_instance.bastion.tags
}
