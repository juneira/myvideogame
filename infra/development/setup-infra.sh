#!/bin/ash

# Localhost is stateless
touch ./terraform.tfstate

terraform init
terraform plan
terraform apply -auto-approve

# This remove the state of Terraform
rm ./terraform.tfstate
