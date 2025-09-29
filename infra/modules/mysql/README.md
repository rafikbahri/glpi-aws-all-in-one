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
| [aws_db_instance.glpi_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.glpi_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.glpi_rds_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.glpi_db_private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.glpi_db_private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage_size"></a> [allocated\_storage\_size](#input\_allocated\_storage\_size) | The allocated storage size for the database. | `number` | `20` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability zones for the subnet. | `list(string)` | <pre>[<br/>  "eu-west-3a",<br/>  "eu-west-3b"<br/>]</pre> | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database. | `string` | `"glpi"` | no |
| <a name="input_db_subnet_1_cidr"></a> [db\_subnet\_1\_cidr](#input\_db\_subnet\_1\_cidr) | CIDR block for the first DB subnet. | `string` | `"10.0.17.0/24"` | no |
| <a name="input_db_subnet_2_cidr"></a> [db\_subnet\_2\_cidr](#input\_db\_subnet\_2\_cidr) | CIDR block for the second DB subnet. | `string` | `"10.0.18.0/24"` | no |
| <a name="input_glpi_ec2_security_group_id"></a> [glpi\_ec2\_security\_group\_id](#input\_glpi\_ec2\_security\_group\_id) | The ID of the GLPI EC2 security group. | `string` | `""` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The identifier for the database. | `string` | `"glpi-mysql"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Whether to enable Multi-AZ deployment for the database. | `bool` | `false` | no |
| <a name="input_password"></a> [password](#input\_password) | The password for the database. | `string` | `"glpi_password"` | no |
| <a name="input_storage_auto_scaling_max_size"></a> [storage\_auto\_scaling\_max\_size](#input\_storage\_auto\_scaling\_max\_size) | The maximum storage size for the database. | `number` | `50` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The storage type for the database. | `string` | `"gp3"` | no |
| <a name="input_username"></a> [username](#input\_username) | The username for the database. | `string` | `"glpi"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Name of the database. |
| <a name="output_db_private_subnet_ids"></a> [db\_private\_subnet\_ids](#output\_db\_private\_subnet\_ids) | IDs of the private subnets for the database. |
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | DB subnet group name used by the RDS instance. |
| <a name="output_rds_arn"></a> [rds\_arn](#output\_rds\_arn) | RDS instance ARN. |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS instance endpoint address. |
| <a name="output_rds_identifier"></a> [rds\_identifier](#output\_rds\_identifier) | RDS instance identifier. |
| <a name="output_rds_port"></a> [rds\_port](#output\_rds\_port) | RDS instance port. |
| <a name="output_rds_security_group_id"></a> [rds\_security\_group\_id](#output\_rds\_security\_group\_id) | Security Group ID attached to the RDS instance. |
| <a name="output_username"></a> [username](#output\_username) | Username for the database. |
<!-- END_TF_DOCS -->