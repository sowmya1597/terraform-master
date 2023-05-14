#!/bin/bash

# Change to Terraform directory

cd dev

# Initialize Terraform
terraform init -migrate-state

# Plan infrastructure changes
echo "Executing terraform plan"
terraform plan -lock=false
echo "Done, terraform plan"

