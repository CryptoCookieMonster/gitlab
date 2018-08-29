#!/usr/bin/env bash

#Change directory to root folder
cd ~

echo "Updating Ubuntu"
#Updating ubuntu
sudo apt update -y

echo "Installing required dependencies for GitLab"
#Installing ca-certificate, curl, and openssh-server
sudo apt install -y ca-certificate curl openssh-server

#Changing to tmp directory
cd /tmp

#Cloning GitLab shell script
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

#Running shell script
sudo bash /tmp/script.deb.sh

#Installing GitLab
sudo apt install -y gitlab-ce

#Enable Firewall
sudo ufw enable

#Opening ports required for GitLab
sudo ufw allow http
sudo ufw allow https
sudo ufw allow OpenSSH
sudo ufw allow 8000

#Reconfigure GitLab Server
sudo gitlab-ctl reconfigure