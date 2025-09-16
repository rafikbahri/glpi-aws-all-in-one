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
  default     = "ubuntu"
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

variable "alb_subnet_1_cidr" {
  type        = string
  default     = "10.0.21.0/24"
  description = "CIDR block for the first ALB subnet"
}

variable "alb_subnet_2_cidr" {
  type        = string
  default     = "10.0.22.0/24"
  description = "CIDR block for the second ALB subnet"
}

variable "glpi_db_name" {
  type        = string
  default     = "glpi"
  description = "Username for the GLPI database"
}

variable "glpi_db_username" {
  type        = string
  default     = "glpi"
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

variable "glpi_data_ebs_volume_size" {
  type        = number
  default     = 20
  description = "Size of the GLPI data EBS volume"
}

variable "glpi_data_ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "Type of the GLPI data EBS volume"
}

variable "glpi_config_ebs_volume_size" {
  type        = number
  default     = 5
  description = "Size of the GLPI config EBS volume"
}

variable "glpi_config_ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "Type of the GLPI config EBS volume"
}

variable "glpi_logs_ebs_volume_size" {
  type        = number
  default     = 10
  description = "Size of the GLPI logs EBS volume"
}

variable "glpi_logs_ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "Type of the GLPI logs EBS volume"
}

variable "db_allocated_storage_size" {
  type        = number
  default     = 20
  description = "Storage size for the GLPI database"
}

variable "db_storage_auto_scaling_max_size" {
  type        = number
  default     = 50
  description = "Maximum storage size for auto-scaling the GLPI database"
}

variable "db_storage_type" {
  type        = string
  default     = "gp3"
  description = "Storage type for the GLPI database"
}