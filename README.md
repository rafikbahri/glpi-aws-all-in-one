# glpi-aws-all-in-one

All in one solution to install and configure GLPI on AWS.

## Todo

Critical

- [ ] Choose between making first setup manual or automatic
- [ ] Refactor install.yml to take in consideration upgrade scenarios

Infra

- [ ] Add DLM backups for EBS volumes
- [ ] Add RDS backups
- [ ] Use S3 lock files for Terraform state instead of DynamoDB locking mechanism

Dev

- [x] Add tfvars for dev, prod, etc.
- [x] Add volumes sizing values for dev, prod, etc.
- [ ] Add Ansible test playbooks
- [ ] Fix idempotency issues in Ansible playbooks
- [ ] Add more documentation

CI

- [ ] Add CI: ansible-lint, markdownlint, tflint, etc.
- [ ] Add CD: deploy terraform to dev, run ansible, etc.

Generic

- [ ] Make the role more generic: works with external DB, as well as internal MariaDB/MySQL, etc.

## Environments tfvars

You need to create a tfvars file for each environment you want to deploy to.

### Example contents (dev.tfvars)

```
region = "eu-west-3"
platform = "dev"

# Networking
vpc_name = "glpi-vpc-dev"
vpc_cidr = "10.0.0.0/16"

bastion_servers_count = 1
bastions_subnet_cidr = "10.0.15.0/24"

# GLPI app subnet
glpi_subnet_cidr = "10.0.16.0/24"

# Database subnets
db_subnet_1_cidr = "10.0.17.0/24"
db_subnet_2_cidr = "10.0.18.0/24"

# ALB public subnets
alb_subnet_1_cidr = "10.0.21.0/24"
alb_subnet_2_cidr = "10.0.22.0/24"

# RDS configuration
glpi_db_identifier = "glpi-db-dev"
glpi_db_name = "glpi"
glpi_db_username = "glpi"
glpi_db_password = "glpi_password"
db_allocated_storage_size = 20
db_storage_auto_scaling_max_size = 50
db_storage_type = "gp3"
glpi_db_multi_az = false

# EBS volumes for GLPI instance
glpi_data_ebs_volume_size = 20
glpi_data_ebs_volume_type = "gp2"
glpi_config_ebs_volume_size = 5
glpi_config_ebs_volume_type = "gp2"
glpi_logs_ebs_volume_size = 10
glpi_logs_ebs_volume_type = "gp2"

# Security
allowed_cidr_blocks = [
  "88.178.215.32/32",
  "23.90.243.176/32"
]
```

### Usage

Run Terraform with the dev tfvars file:

```
export AWS_INFRA_PLATFORM=dev
jobs/plan && jobs/deploy
```

You can create other environment files (e.g., `envs/prod.tfvars`) by copying this file and adjusting values such as CIDRs, instance sizes, and `glpi_db_*` settings.

## Cleanup

```
export AWS_INFRA_PLATFORM=dev
jobs/destroy
```
