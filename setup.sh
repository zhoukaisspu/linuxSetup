#!/bin/bash
# Run the subscript to complete different settings
# If each one script failed, it will be stoped

. ./common/common.sh

printlog "+++++++++Start to Invoke tmuxSetup.sh"
bash  ./tmuxSetup.sh
checkExitCode $? "tmuxSetup.sh"
printlog "---------tmuxSetup.sh sucefully"


printlog "+++++++++Start to invoke jreSetup.sh"
bash ./jreSetup.sh
checkExitCode $? "jreSetup.sh"
printlog "---------jreSetup.sh sucessfully"


printlog "+++++++++Start to invoke devToolSetup.sh"
bash ./devToolSetup.sh
checkExitCode $? "devToolSetup.sh"
printlog "---------devToolSetup.sh sucessfully"
