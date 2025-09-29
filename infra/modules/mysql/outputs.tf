output "rds_endpoint" {
  description = "RDS instance endpoint address."
  value       = aws_db_instance.glpi_db.address
}

output "rds_port" {
  description = "RDS instance port."
  value       = aws_db_instance.glpi_db.port
}

output "rds_identifier" {
  description = "RDS instance identifier."
  value       = aws_db_instance.glpi_db.id
}

output "rds_arn" {
  description = "RDS instance ARN."
  value       = aws_db_instance.glpi_db.arn
}

output "rds_security_group_id" {
  description = "Security Group ID attached to the RDS instance."
  value       = aws_security_group.glpi_rds_sg.id
}

output "db_subnet_group_name" {
  description = "DB subnet group name used by the RDS instance."
  value       = aws_db_subnet_group.glpi_db_subnet_group.name
}

output "db_private_subnet_ids" {
  description = "IDs of the private subnets for the database."
  value       = [
    aws_subnet.glpi_db_private_subnet_1.id,
    aws_subnet.glpi_db_private_subnet_2.id,
  ]
}

output "db_name" {
  description = "Name of the database."
  value       = aws_db_instance.glpi_db.db_name
}

output "username" {
  description = "Username for the database."
  value       = aws_db_instance.glpi_db.username
}