#!/bin/bash
# Run the subscript to complete different settings
# If each one script failed, it will be stoped

. ./common/common.sh

printlog "Start to Invoke tmuxSetup.sh"
bash  ./tmuxSetup.sh
checkExitCode $? "tmuxSetup.sh"
printlog "tmuxSetup.sh sucefully"

#echo "Hello World"
#echo "Start to install vim"
#sudo apt-get -y install vim  
#echo "Install vim successfully"
#echo "Startt to install git"
#sudo apt-get -y install git 
#echo "Install git succssfully"
#echo "Start to install tmux"
#sudo apt-get -y install tmux
#echo "Install tmux sucessfully"
