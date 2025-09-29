<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.glpi_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_ebs_volume.glpi_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_ebs_volume.glpi_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_volume_attachment.glpi_config_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_volume_attachment.glpi_data_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_volume_attachment.glpi_logs_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability zones for the EBS volumes | `list(string)` | n/a | yes |
| <a name="input_glpi_config_ebs_volume_size"></a> [glpi\_config\_ebs\_volume\_size](#input\_glpi\_config\_ebs\_volume\_size) | Size of the GLPI config EBS volume | `number` | `5` | no |
| <a name="input_glpi_config_ebs_volume_type"></a> [glpi\_config\_ebs\_volume\_type](#input\_glpi\_config\_ebs\_volume\_type) | Type of the GLPI config EBS volume | `string` | `"gp2"` | no |
| <a name="input_glpi_data_ebs_volume_size"></a> [glpi\_data\_ebs\_volume\_size](#input\_glpi\_data\_ebs\_volume\_size) | Size of the GLPI data EBS volume | `number` | `20` | no |
| <a name="input_glpi_data_ebs_volume_type"></a> [glpi\_data\_ebs\_volume\_type](#input\_glpi\_data\_ebs\_volume\_type) | Type of the GLPI data EBS volume | `string` | `"gp2"` | no |
| <a name="input_glpi_instance_id"></a> [glpi\_instance\_id](#input\_glpi\_instance\_id) | ID of the GLPI instance | `string` | n/a | yes |
| <a name="input_glpi_logs_ebs_volume_size"></a> [glpi\_logs\_ebs\_volume\_size](#input\_glpi\_logs\_ebs\_volume\_size) | Size of the GLPI logs EBS volume | `number` | `10` | no |
| <a name="input_glpi_logs_ebs_volume_type"></a> [glpi\_logs\_ebs\_volume\_type](#input\_glpi\_logs\_ebs\_volume\_type) | Type of the GLPI logs EBS volume | `string` | `"gp2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->