variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "AWS region"
}

variable "vpc_name" {
  type        = string
  default     = "glpi-vpc"
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "bastion_servers_count" {
  type        = string
  default     = "1"
  description = "Number of bastion servers"
}

variable "bastions_subnet_cidr" {
  type        = string
  default     = "10.0.15.0/24"
  description = "CIDR block for the bastion subnet"
}

variable "create_key" {
  type        = bool
  default     = false
  description = "Create a new SSH key pair for the bastion servers"
}
