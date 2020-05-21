#!/bin/bash
# Install jenkins on the host machine

source ./common/common.sh

printlog "Start to get jenkins key and add into apt"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
checkExitCode $? "Set jenkins key"
printlog "Jenkins key set sucessfully"

printlog "Start to add jenkins list to apt"
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
checkExitCode $? "Install jenkins apt list"
printlog "Add jenkins apt list sucefully"

printlog "Start to update Repo"
sudo apt-get update
checkExitCode $? "apt-update"
printlog "apt-update sucessfully"

printlog "Start to install Jenkins"
sudo apt-get install jenkins
checkExitCode $? "Install jenkins"
printlog "Install jenkins sucefully"
