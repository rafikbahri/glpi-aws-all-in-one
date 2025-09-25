variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  type        = string
}

variable "glpi_subnet_cidr" {
  description = "CIDR block for the GLPI subnet."
  type        = string
}

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  type        = string
}

variable "ssh_from_security_groups_ids" {
  description = "List of security group IDs allowed to access the private instances via SSH."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the GLPI instance."
  type        = string
}
