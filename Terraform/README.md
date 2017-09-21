# Provisioning and Configuring Servers with Terraform

Terraform will create infrastructure in AWS EC2 as well as configure the instances with nginx and run TestInfra unit tests. This is a single click solution and tries to make everything as automated as possible.

# Basic Usage

1. Run `export AWS_ACCESS_KEY_ID` and `export AWS_SECRET_ACCESS_KEY`
2. Since Terraform needs the private key to SSH to the server(s) it creates to provision them afterwards, you will need to have the private SSH key in the Terraform folder called `nginx-test-key`. In the keys.tf file, update the public key to whatever the public key you generated is.
3. Run `terraform plan` to see what will get created.
4. Run `terraform apply` to apply all changes
5. Sit back and relax and let Terraform take care of creating EC2 instances, security group, key pairs and then configures them using the provision_server.sh script in the Terraform folder of this project. This shell script install dependencies, clones this repo and runs Ansible to setup NGINX and then run the TestInfra unit tests afterwards.
6. Profit! Go to the site using the Public IP address or DNS and see the `Hello World!` page be returned.
