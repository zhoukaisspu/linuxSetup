#!/bin/bash
# Install the denpendency software for automation job

source ../common/common.sh

printlog "apt-get update first"
sudo apt-get update
checkExitCode $? "apt-get update"
printlog "apt-get update successfully"

printlog "Start to install cppcheck"
sudo apt-get -y install cppcheck
checkExitCode $? "Install cppCheck"
printlog "cppcheck install successfully"
