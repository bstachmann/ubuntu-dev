#!/bin/bash
sudo apt update
sudo apt install ansible
sudo apt install git
ansible-galaxy install -r requirements.yml --roles-path=~/ansible-roles "$@"
