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
| [aws_instance.glpi_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.glpi_ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the GLPI instance. | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the subnet. | `string` | n/a | yes |
| <a name="input_glpi_subnet_cidr"></a> [glpi\_subnet\_cidr](#input\_glpi\_subnet\_cidr) | CIDR block for the GLPI subnet. | `string` | n/a | yes |
| <a name="input_nat_gateway_id"></a> [nat\_gateway\_id](#input\_nat\_gateway\_id) | ID of the NAT Gateway. | `string` | n/a | yes |
| <a name="input_ssh_from_security_groups_ids"></a> [ssh\_from\_security\_groups\_ids](#input\_ssh\_from\_security\_groups\_ids) | List of security group IDs allowed to access the private instances via SSH. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glpi_ec2_security_group_id"></a> [glpi\_ec2\_security\_group\_id](#output\_glpi\_ec2\_security\_group\_id) | The ID of the GLPI EC2 security group. |
| <a name="output_glpi_instance_id"></a> [glpi\_instance\_id](#output\_glpi\_instance\_id) | The ID of the GLPI instance. |
| <a name="output_glpi_instance_tags"></a> [glpi\_instance\_tags](#output\_glpi\_instance\_tags) | The tags of the GLPI instance. |
| <a name="output_glpi_private_ip"></a> [glpi\_private\_ip](#output\_glpi\_private\_ip) | The private IP address of the GLPI instance. |
| <a name="output_glpi_private_subnet_id"></a> [glpi\_private\_subnet\_id](#output\_glpi\_private\_subnet\_id) | The ID of the private subnet. |
<!-- END_TF_DOCS -->