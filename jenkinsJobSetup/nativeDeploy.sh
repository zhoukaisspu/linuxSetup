#!/bin/bash
# It will clone the automation job from remote server and
# deploy these into host computer.
# It can imporve the jenkins performance, since jenkins have to
# clone the job and execute it.

source ../common/common.sh
source ./globalVar.sh

CURRENT_DIR=$(getScriptAbsolutePath)
cd "${CURRENT_DIR}"

printlog "+++++Start to invoke cppscanSetup.sh" 
bash ./cppscanSetup.sh
checkExitCode $? "run cppscanSetup.sh"
printlog "-----Invoke cppscanSetup.sh successfully"
