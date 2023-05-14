#!/bin/bash

pwd
export GOOGLE_APPLICATION_CREDENTIALS="/var/lib/jenkins/workspace/install-webserver2/keys/appKey.json"

# Change to Terraform directory
cd dev
echo "print path..."
pwd

# Initialize Terraform
terraform init

# Plan infrastructure changes
echo "Executing terraform plan"
terraform plan -lock=false
echo "Done, terraform plan"

