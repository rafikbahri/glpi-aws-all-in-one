#!/bin/bash

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFb4AloR5UZKuVKDDjVlAeMxj+A9e0Pkw6XU/izk6kP/ rbahri@Rafiks-MacBook-Pro.local" >> /home/ubuntu/.ssh/authorized_keys

sudo apt update
sudo apt upgrade -y

sudo apt install amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent