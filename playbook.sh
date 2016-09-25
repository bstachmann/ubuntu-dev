#!/bin/bash

ansible-playbook ubuntu-dev.yml --ask-sudo-pass "$@"
