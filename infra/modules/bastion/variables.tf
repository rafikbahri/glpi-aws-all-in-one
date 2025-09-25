variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "bastions_subnet_cidr" {
  description = "CIDR block for the bastion subnet."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the bastion."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the bastion instance."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the bastion host."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}