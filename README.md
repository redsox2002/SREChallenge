# Welcome to the SRE Challenge Project!

This entire project is controlled via Terraform (Provisioning, Configuring and Testing). Go to the `Terraform` folder to learn more about setting up and running this project!

The benefits of using Terraform is scability. AWS does have auto-scaling built in, but if a private cloud provider like OpenStack is used for example using Terraform you can scale up as Terraform keeps the state of the infrastructure already created. You can just choose a new `count` for the amount of instances you want and Terraform will provision only the new instances. This is all made possible through the terraform.tfstate file which tracks the current state of the infrastructure created via Terraform. After scaling up, one can add the new servers to a HAProxy server for load balancing.

To view the finished working URL, type this in your browser: http://ec2-34-227-224-25.compute-1.amazonaws.com. You will notice it will redirect you to HTTPS.

# Software Used in this Project:

- Ansible (https://www.ansible.com/), configuration management software.
- Terraform (https://www.terraform.io/), infrastructure as code software.
- TestInfra (http://testinfra.readthedocs.io/en/latest/), testing infrastructure software.

# Cloud Provider Used:

- Amazon Web Services

