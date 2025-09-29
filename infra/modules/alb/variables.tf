variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "alb_subnet_1_cidr" {
  description = "CIDR block for the first ALB subnet."
  type        = string
}

variable "alb_subnet_2_cidr" {
  description = "CIDR block for the second ALB subnet."
  type        = string
}

variable "bastion_public_route_table_id" {
  description = "ID of the bastion public route table."
  type        = string
}

variable "glpi_ec2_security_group_id" {
  description = "ID of the GLPI EC2 security group."
  type        = string
}

variable "glpi_ec2_instance_id" {
  description = "ID of the GLPI EC2 instance."
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the ALB."
  type        = list(string)
}