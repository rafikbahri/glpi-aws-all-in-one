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
