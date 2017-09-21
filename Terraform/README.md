# Provisioning and Configuring Servers with Terraform

Terraform will create infrastructure in AWS EC2 as well as configure the instances with nginx and run TestInfra unit tests. This is a single click solution and tries to make everything as automated as possible.

# Basic Usage

1. Run `export AWS_ACCESS_KEY_ID=` and `export AWS_SECRET_ACCESS_KEY=`
2. Since Terraform needs the private key to SSH to the server(s) it creates to provision them afterwards, you will need to have the private SSH key in the Terraform folder called `nginx-test-key`. You can create the key simply using `ssh-keygen` and specifying the location where you want to save and the name of the key (nginx-test-key). In the keys.tf file, update the public key to whatever the public key you generated is.
3. Run `terraform plan` to see what will get created. You will need to specify the AWS region.
4. Run `terraform apply` to apply all changes. You will need to specify the AWS region.
5. Sit back and relax and let Terraform take care of creating EC2 instances, VPC, subnets, routing tables, internet gateway, security group, key pairs and then configures them using the provision_server.sh script in the Terraform folder of this project. This shell script install dependencies, clones this repo and runs Ansible to setup NGINX and then run the TestInfra unit tests afterwards.
6. Profit! Go to the site using the Public IP address or DNS and see the `Hello World!` page be returned.

# Notes

To scale up from 1 to x instances, simply update `ec2-machines.tf` file on line 2 where it says `count = "${var.count}"`. The default count is set to 1 in the `variables.tf` file so you can override this to how many instances you please. Terraform FTW!
