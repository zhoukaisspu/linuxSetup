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
