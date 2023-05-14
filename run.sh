#!/bin/bash

# Change to Terraform directory

cd dev

# Initialize Terraform
terraform init
terraform validate
# Plan infrastructure changes
echo "Executing terraform plan"
terraform plan -lock=false
echo "Done, terraform plan"

