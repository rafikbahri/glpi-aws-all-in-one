output "backend_config" {
  value       = module.s3-backend.tf_backend_config_string
  description = "Terraform backend configuration string"
  depends_on  = []
}
