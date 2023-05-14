#!/bin/bash

# Change to Terraform directory

#cd terraform

# Initialize Terraform
terraform init

# Plan infrastructure changes
echo "Executing terraform plan"
terraform plan -lock=false
echo "Done, terraform plan"

