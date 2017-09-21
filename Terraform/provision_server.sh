#!/bin/bash

# Install yum dependencies
sudo yum -y update
sudo yum -y groupinstall "Development tools"
sudo yum -y install epel-release

# Remove Amazon Linux AMI pip install

sudo rm /usr/bin/pip

# Install pip, ansible and testinfra
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
export PATH=$PATH:$HOME/bin:/usr/local/bin
source ~/.bash_profile
pip install ansible --user
pip install testinfra --user

set -x
# Clone GitHub repo with Ansible playbook
git clone https://github.com/redsox2002/SREChallenge.git
cd SREChallenge/Ansible
ansible-playbook -i hosts nginx.yml

# Run testinfra
cd ../Tests
testinfra -v test_myinfra.py
