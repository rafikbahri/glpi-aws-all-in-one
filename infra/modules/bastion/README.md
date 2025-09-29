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
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks allowed to access the bastion. | `list(string)` | n/a | yes |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the bastion instance. | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the subnet. | `string` | n/a | yes |
| <a name="input_bastions_subnet_cidr"></a> [bastions\_subnet\_cidr](#input\_bastions\_subnet\_cidr) | CIDR block for the bastion subnet. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the bastion host. | `string` | n/a | yes |
| <a name="input_internet_gateway_id"></a> [internet\_gateway\_id](#input\_internet\_gateway\_id) | ID of the Internet Gateway. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_instance_tags"></a> [bastion\_instance\_tags](#output\_bastion\_instance\_tags) | Tags of the bastion instance |
| <a name="output_bastion_private_ip"></a> [bastion\_private\_ip](#output\_bastion\_private\_ip) | Private IP of bastion host |
| <a name="output_bastion_public_dns"></a> [bastion\_public\_dns](#output\_bastion\_public\_dns) | Public DNS of bastion host |
| <a name="output_bastion_public_ip"></a> [bastion\_public\_ip](#output\_bastion\_public\_ip) | Public IP of bastion host |
| <a name="output_bastion_public_route_table_id"></a> [bastion\_public\_route\_table\_id](#output\_bastion\_public\_route\_table\_id) | ID of the public route table |
| <a name="output_bastion_public_subnet_id"></a> [bastion\_public\_subnet\_id](#output\_bastion\_public\_subnet\_id) | ID of the public subnet |
| <a name="output_bastion_security_group_id"></a> [bastion\_security\_group\_id](#output\_bastion\_security\_group\_id) | ID of the bastion security group |
<!-- END_TF_DOCS -->