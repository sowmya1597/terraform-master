#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS="~/keys/appKey.json"

# Change to Terraform directory
cd dev

# Initialize Terraform
terraform init

# Plan infrastructure changes
echo "Executing terraform plan"
terraform plan -lock=false
echo "Done, terraform plan"

