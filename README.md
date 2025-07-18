# glpi-aws-all-in-one

All in one solution to install and configure GLPI on AWS.

## Todo

Infra

- [ ] Add DLM backups for EBS volumes
- [ ] Add RDS backups

Dev

- [ ] Add tfenvs for dev, prod, etc.
- [ ] Add volumes sizing values for dev, prod, etc.
- [ ] Fix changed tasks in Ansible playbooks
- [ ] Add Ansible test playbooks
- [ ] Add more documentation

CI

- [ ] Add CI: ansible-lint, markdownlint, tflint, etc.
- [ ] Add CD: deploy terraform to dev, run ansible, etc.
