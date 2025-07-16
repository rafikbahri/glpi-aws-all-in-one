output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  description = "Public DNS of bastion host"
  value       = aws_instance.bastion.public_dns
}

output "glpi_private_ip" {
  description = "Private IP of GLPI instance"
  value       = aws_instance.glpi_instance.private_ip
}

output "ssh_commands" {
  description = "SSH commands to access instances"
  value = {
    bastion   = "ssh -i ~/.ssh/id_ed25519_bastion ubuntu@${aws_instance.bastion.public_ip}"
    glpi_jump = "ssh -i ~/.ssh/id_ed25519_bastion -J ubuntu@${aws_instance.bastion.public_ip} ubuntu@${aws_instance.glpi_instance.private_ip}"
  }
}

output "ssh_config" {
  description = "SSH config file entries"
  value       = <<-EOF
Host bastion
    HostName ${aws_instance.bastion.public_ip}
    User ubuntu
    IdentityFile ~/.ssh/id_ed25519_bastion

Host glpi
    HostName ${aws_instance.glpi_instance.private_ip}
    User ubuntu
    User ec2-user
    IdentityFile ~/.ssh/id_ed25519_bastion
    ProxyJump bastion
EOF
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "ami_id" {
  description = "AMI ID used for the EC2 instances"
  value       = data.aws_ami.ubuntu.id
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.glpi_alb.dns_name
}