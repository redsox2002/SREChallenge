#!/bin/bash

# Install virtualenv
sudo yum install -y python-devel python-setuptools python-pip
sudo pip install virtualenv

# Initializing virtualenv
virtualenv --python=$(type -p python2.7) .venv
source .venv/bin/activate

# Install goss
curl -fsSL https://goss.rocks/install | sudo GOSS_DST=/usr/bin sh

# Download and install nodejs rpm
curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -

# Install yum dependencies
sudo yum -y update
sudo yum -y groupinstall "Development tools"

set -x
# Clone GitHub repo with Ansible playbook
git clone https://github.com/redsox2002/SREChallenge.git
cd SREChallenge
pip install -r requirements.txt
cd Ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts default.yml

# Run goss tests
cd ../Tests
goss validate

# Deactivates virtualenv
deactivate
