variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the subnet."
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"]
}

variable "db_subnet_1_cidr" {
  description = "CIDR block for the first DB subnet."
  type        = string
  default     = "10.0.17.0/24"
}

variable "db_subnet_2_cidr" {
  description = "CIDR block for the second DB subnet."
  type        = string
  default     = "10.0.18.0/24"
}

variable "glpi_ec2_security_group_id" {
  description = "The ID of the GLPI EC2 security group."
  type        = string
  default     = ""
}

variable "allocated_storage_size" {
  description = "The allocated storage size for the database."
  type        = number
  default     = 20
}

variable "storage_auto_scaling_max_size" {
  description = "The maximum storage size for the database."
  type        = number
  default     = 50
}

variable "storage_type" {
  description = "The storage type for the database."
  type        = string
  default     = "gp3"
}

variable "identifier" {
  description = "The identifier for the database."
  type        = string
  default     = "glpi-mysql"
}

variable "db_name" {
  description = "The name of the database."
  type        = string
  default     = "glpi"
}

variable "username" {
  description = "The username for the database."
  type        = string
  default     = "glpi"
}

variable "password" {
  description = "The password for the database."
  type        = string
  default     = "glpi_password"
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment for the database."
  type        = bool
  default     = false
}