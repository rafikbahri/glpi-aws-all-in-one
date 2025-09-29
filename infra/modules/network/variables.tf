variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "bastion_public_subnet_id" {
  description = "The ID of the bastion public subnet"
  type        = string
}