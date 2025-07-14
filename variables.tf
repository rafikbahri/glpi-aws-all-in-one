variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "AWS region"
}

variable "platform" {
  type        = string
  default     = "dev"
  description = "Deployment platform (dev, staging, prod)"
}

variable "ssh_user" {
  type        = string
  default     = "ec2-user"
  description = "SSH user for the bastion servers"
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
  type        = number
  default     = 1
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

variable "glpi_cluster_servers_count" {
  type        = number
  default     = 1
  description = "Number of GLPI cluster servers"
}

variable "glpi_subnet_cidr" {
  type        = string
  default     = "10.0.16.0/24"
  description = "CIDR block for the GLPI subnet"
}


variable "db_subnet_1_cidr" {
  type        = string
  default     = "10.0.17.0/24"
  description = "CIDR block for the first DB subnet"
}

variable "db_subnet_2_cidr" {
  type        = string
  default     = "10.0.18.0/24"
  description = "CIDR block for the second DB subnet"
}

variable "glpi_db_username" {
  type        = string
  default     = "glpi_user"
  description = "Username for the GLPI database"
}

variable "glpi_db_password" {
  type        = string
  default     = "glpi_password"
  description = "Password for the GLPI database"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access bastion host"
  type        = list(string)
  default     = ["88.178.215.32/32"] # Replace with your own IP or CIDR block
}