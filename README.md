# Welcome to the SRE Challenge Project!

This entire project is controlled via Terraform (Provisioning, Configuring and Testing). Go to the `Terraform` folder to learn more about setting up and running this project!

The benefits of using Terraform is scability. AWS does have auto-scaling built in, but if a private cloud provider like OpenStack is used for example using Terraform you can scale up as Terraform keeps the state of the infrastructure already created. You can just choose a new `count` for the amount of instances you want and Terraform will provision only the new instances. This is all made possible through the terraform.tfstate file which tracks the current state of the infrastructure created via Terraform. After scaling up, one can add the new servers to a HAProxy server for load balancing.

SEA Team, please build this out locally as I do not want to occur charges from AWS for hosting a VPC/EC2/etc. It adds up quick :smiley:

# Software Used in this Project:

- Ansible (https://www.ansible.com/), configuration management software.
- Terraform (https://www.terraform.io/), infrastructure as code software.
- TestInfra (http://testinfra.readthedocs.io/en/latest/), testing infrastructure software.

# Cloud Provider Used:

- Amazon Web Services
