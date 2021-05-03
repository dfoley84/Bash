#!/bin/sh

# Install packages
apt-get update -y 
apt-get upgrade -y 
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get update -y 
apt-get install ansible -y 


#Installing Pip Packages
apt-get install -y python-setuptools libssl-dev libffi-dev python-dev python-pip curl wget
pip install pyvmomi
pip install requests-credssp
pip install pywinrm 
pip install pywinrm[credssp]
apt-get update
apt-get upgrade -y
apt-get install git -y
apt-get install openjdk-8-jdk
apt-get install maven

