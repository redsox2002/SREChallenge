#!/bin/bash

# Initializing terraform files for the cloud provider
echo "...Initializing working directory..."
terraform init

echo "...Creating key pair..."
# Creating ssh key
ssh-keygen -t rsa -N "" -f $PWD/nginx-test-key -C "Created by Terraform"

export public_key=$(cat nginx-test-key.pub)

echo "...Updating key.tf file with nginx-test-key.pub..."
sed -i -e 's~public_key = *$~public_key = "'"$public_key"'"~' key.tf

echo -n "Please enter your AWS Access Key: "
read Access

echo -n "Please enter your AWS Secret Access Key: "
read Secret

echo -n "Please enter the AWS region where you want to build out your infrastructure: "
read region

export AWS_ACCESS_KEY_ID=$Access
export AWS_SECRET_ACCESS_KEY=$Secret
export AWS_DEFAULT_REGION=$region

set -e
echo "...Running Terraform Plan..."

terraform plan

read -r -p "Do you want to apply this Terraform plan? [Y/n]: " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  terraform apply
else
	exit
fi

public_dns=$(aws --profile personal ec2 describe-instances --filters Name=instance-state-name,Values=running --region $region | jq -r ".Reservations[0].Instances[0].PublicDnsName")

echo "Please visit http://$public_dns to view the site"
