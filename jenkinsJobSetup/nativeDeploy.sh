#!/bin/bash
# It will clone the automation job from remote server and
# deploy these into host computer.
# It can imporve the jenkins performance, since jenkins have to
# clone the job and execute it.

# How to deploy the remote repo into local
# Invoke the `jobSetup.sh` with 3 parameters
# firat parameter: "the url of remote repo"
# second parameter: "the path of local bare repo"
# third parameter: "thel path of clone destination"

CURRENT_DIR=$(dirname $0)
cd ${CURRENT_DIR}

source ../common/common.sh
source ./globalVar.sh

printlog "+++++Start to invoke cppscanSetup.sh" 
#bash ./cppscanSetup.sh
bash ./jobSetup.sh "${CPPSCAN_REMOTE_REPO}" "${CPPSCAN_DIR}" "${CPPSCAN_SOURCE_DIR}"
checkExitCode $? "run cppscanSetup.sh"
printlog "-----Invoke cppscanSetup.sh successfully"

printlog "+++++Start to invoke db.cppscanSetup.sh"
bash ./dbcppscanSetup.sh
checkExitCode $? "run dbcppscanSetup.sh"
printlog "-----Invoke dbcppscanSetup.sh successfully"

printlog "+++++Start to invoke kws.sh"
bash ./kws.sh
checkExitCode $? "run kws.sh"
printlog "-----Invoke kws.sh successfully"