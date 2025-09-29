variable "availability_zones" {
  description = "Availability zones for the EBS volumes"
  type        = list(string)
}

variable "glpi_instance_id" {
  description = "ID of the GLPI instance"
  type        = string
}

variable "glpi_config_ebs_volume_size" {
  description = "Size of the GLPI config EBS volume"
  type        = number
  default     = 5
}

variable "glpi_config_ebs_volume_type" {
  description = "Type of the GLPI config EBS volume"
  type        = string
  default     = "gp2"
}

variable "glpi_data_ebs_volume_size" {
  description = "Size of the GLPI data EBS volume"
  type        = number
  default     = 20
}

variable "glpi_data_ebs_volume_type" {
  description = "Type of the GLPI data EBS volume"
  type        = string
  default     = "gp2"
}

variable "glpi_logs_ebs_volume_size" {
  description = "Size of the GLPI logs EBS volume"
  type        = number
  default     = 10
}

variable "glpi_logs_ebs_volume_type" {
  description = "Type of the GLPI logs EBS volume"
  type        = string
  default     = "gp2"
}