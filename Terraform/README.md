# Provisioning and Configuring Servers with Terraform

Terraform will create infrastructure in AWS EC2 as well as configure the instances with nginx and run TestInfra unit tests. This is a single click solution and tries to make everything as automated as possible.

# Before Using

1. Download and install Terraform for your operating system (https://www.terraform.io/downloads.html)
2. Clone this repo and `cd` into the `Terraform` folder.
3. Run `terraform init` which will initialize the working directory containing the Terraform files for the cloud provider (AWS in this case).

# Basic Usage

1. Run `export AWS_ACCESS_KEY_ID=` and `export AWS_SECRET_ACCESS_KEY=`
2. Since Terraform needs the private key to SSH to the server(s) it creates to provision them afterwards, you will need to have the private SSH key in the Terraform folder called `nginx-test-key`. You can create the key simply using `ssh-keygen` and specifying the location where you want to save and the name of the key (nginx-test-key). In the keys.tf file, update the public key to whatever the public key you generated is.
3. Run `terraform plan` to see what will get created. You will need to specify the AWS region.
4. Run `terraform apply` to apply all changes. You will need to specify the AWS region.
5. Sit back and relax and let Terraform take care of creating EC2 instances, VPC, subnets, routing tables, internet gateway, security group, key pairs and then configures them using the provision_server.sh script in the Terraform folder of this project. This shell script install dependencies, clones this repo and runs Ansible to setup NGINX and then run the TestInfra unit tests afterwards.
6. Profit! Go to the site using the Public IP address or DNS and see the `Hello World!` page be returned.

# Using setup.sh file

1. This will work on nix machines, haven't tested on Windows yet, make sure you have the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) and [jq](https://stedolan.github.io/jq/download/) installed.
2. Run `./setup.sh`, this file does the following:
  * Runs `terraform init`
  * Creates the key pair called `nginx-test-key` and `nginx-test-key.pub`
  * Updates key.tf with the public key
  * It then asks you to put in your AWS Access Key, Secret Access Key and default region
  * Runs `terraform plan` and lets you view what Terraform will create
  * With user input to proceed, it will run `terraform apply` and create all infrastructure, run Ansible to setup NGINX and run TestInfra unit tests
  * After it succeeds, the script will return back to the Public DNS of the EC2 instance Terraform creates. You can now visit the site.

# Scaling Up

To scale up from 1 to x instances, simply update `ec2-machines.tf` file on line 2 where it says `count = "${var.count}"`. The default count is set to 1 in the `variables.tf` file so you can override this to how many instances you please. Terraform FTW!

# Notes

You might wonder why index.html is in the root of the repo instead of being stored in the `files` folder in Ansible. This is because in a real-world scenario, a developer would not update the index.html file in the Ansible Galaxy files folder but instead in the SCM itself hence why it's there.
