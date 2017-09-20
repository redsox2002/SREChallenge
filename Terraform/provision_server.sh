#!/bin/bash

# Install dependencies
sudo yum -y update
sudo yum -y groupinstall "Development tools"
sudo yum -y install epel-release
sudo yum -y install ansible

# Install pip and testinfra
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install testinfra

# Clone GitHub repo with Ansible playbook
git clone https://github.com/redsox2002/SRE_Challenge.git
cd Ansible
ansible-playbook -i hosts nginx.yml

# Run testinfra
cd ../Tests
testinfra -v test_myinfra.py
