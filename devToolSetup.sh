#!/bin/bash


source ./common/common.sh

printlog "Start to install vim"
sudo apt-get -y install vim  
checkExitCode $? "Install vim"
printlog "Vim install sucessfully"

printlog "Start to install git"
sudo apt-get -y install git 
checkExitCode $? "Install git"
printlog "git install sucessfully"

printlog "Start to install tmux"
sudo apt-get -y install tmux
checkExitCode $? "Install tmux"
printlog "tmux install sucessfully"

printlog "Start to install curl"
sudo apt-get -y install curl
checkExitCode $? "Install curl"
printlog "curl install successfully"

printlog "Start to install python3"
sudo apt-get -y install python3
checkExitCode $? "Install python3"
printlog "python3 install successfully"
