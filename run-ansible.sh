#!/bin/bash

if ! command -v ansible > /dev/null ; then
  sudo apt update

  sudo apt install -y ansible

  if ! command -v git > /dev/null ; then
    sudo apt install -y git
  fi

  ansible-galaxy install -r requirements.yml --roles-path=~/ansible-roles "$@"
fi

ansible-playbook ubuntu-dev.yml --ask-sudo-pass "$@"
