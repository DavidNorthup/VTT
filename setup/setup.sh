#!/bin/bash


# Install ansible if it does not already exist on this device
ansible-playbook --version &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing ansible"
    sudo dnf -y install ansible-core
else
    echo "Ansible is already installed. Proceeding"
fi

(cd setup && ansible-playbook setup_local_env.yaml --ask-pass --ask-become-pass)