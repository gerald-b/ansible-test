#!/bin/bash
apt update && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y
apt install -y ansible git hcloud-cli
useradd -s /bin/bash -d /home/ansible -m -G users ansible
mkdir -p /home/ansible/.ssh/
chown ansible:ansible /home/ansible/.ssh/
chmod 700 /home/ansible/.ssh/
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUk5Yk7aNThdmIPjC9oUYaix7dD51smtJhxRxOsjzG1 gerald@buechler.bayern" > /home/ansible/.ssh/authorized_keys
chown ansible:ansible /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
echo "source <(hcloud completion bash)" >> ~/.bashrc
echo "source <(hcloud completion bash)" >> /home/ansible/.bashrc
source <(hcloud completion bash)
echo -e "************************************************************"
echo -e "***"
echo -e "*** Bitte den Hetzner Cloud API Token hinzufügen"
echo -e "***"
echo -e "*** ACHTUNG - Keine Anzeige von Zeichen"
echo -e "***"
echo -e "************************************************************"
# hcloud context create my-controller
su - ansible -c 'hcloud context create my-controller'
# su - ansible -c 'git clone https://github.com/gerald-b/ansible-test.git .'
su - ansible -c 'git init'
su - ansible -c 'git remote add origin https://github.com/gerald-b/ansible-test.git'
su - ansible -c 'git fetch'
# Required when the versioned files existed in path before "git init" of this repo.
su - ansible -c 'git reset origin/master'
su - ansible -c 'git checkout -t origin/master'
