# Welcome to the SRE Challenge Project!

```
Using whatever infrastructure-as-code (e.g. Cloudformation, Terraform) or configuration management tools
(e.g. Puppet, Chef, Ansible) you prefer, and whatever full-service IaaS cloud provider you feel
comfortable in (AWS, Azure, GCP, OpenStack) write code intended to create the following:
·         Three running web servers behind a load balancer, which is publicly accessible. The web servers
          should have NodeJS, Ruby and Java installed.
·         A Redis installation accessible by the web servers
·         A relational database of your choice accessible by the web servers
·         A cloud storage bucket (S3 or similar) with read-only access from the web servers.
```

This entire project is controlled via Terraform (Provisioning, Configuring and Testing). Go to the [Terraform](https://github.com/redsox2002/SREChallenge/tree/master/Terraform) folder to learn more about setting up and running this project!

The benefits of using Terraform is scability. You can just choose a new `count` for the amount of instances you want and Terraform will provision only the new instances. This is all made possible through the terraform.tfstate file which tracks the current state of the infrastructure created via Terraform. After scaling up, the new instance can be added to the Elastic Load Balancer (ELB).

# Software Used in this Project:

- Ansible (https://www.ansible.com/), configuration management software.
- Terraform (https://www.terraform.io/), infrastructure as code software.
- Goss (https://github.com/aelsabbahy/goss), testing infrastructure software.

# Cloud Provider Used:

- Amazon Web Services
