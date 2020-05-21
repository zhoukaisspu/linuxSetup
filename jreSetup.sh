#!/bin/bash
# Setup environment about jre and jdk
# It will try to install openjdk-8-jdk openjdk-8-jre

source ./common/common.sh


printlog "Start to Install openjdk-8-jdk"
sudo apt-get -y install openjdk-8-jdk
checkExitCode $? "Install openjdk-8-jdk"
printlog "openjdk-8-jdk install successfully"

printlog "Start to install openjdk-8-jre"
sudo apt-get -y install openjdk-8-jre
checkExitCode $? "Install openjdk-8-jre"
printlog "openjdk-8-jre install sucessfully"
