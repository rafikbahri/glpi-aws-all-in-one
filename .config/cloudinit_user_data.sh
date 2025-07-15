#!/bin/bash

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFb4AloR5UZKuVKDDjVlAeMxj+A9e0Pkw6XU/izk6kP/ rbahri@Rafiks-MacBook-Pro.local" >> /home/ec2-user/.ssh/authorized_keys

sudo yum update
sudo yum upgrade -y

sudo yum install amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent