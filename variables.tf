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
