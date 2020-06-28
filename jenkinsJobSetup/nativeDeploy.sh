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

printlog "+++++Start to setup cppscan" 
#bash ./cppscanSetup.sh
bash ./jobSetup.sh "${CPPSCAN_REMOTE_REPO}" "${CPPSCAN_DIR}" "${CPPSCAN_SOURCE_DIR}"
checkExitCode $? "setup cppscan"
printlog "-----Setup cppscan successfully"

printlog "+++++Start to setup db.cppscanSetup"
#bash ./dbcppscanSetup.sh
bash ./jobSetup "${DB_CPPSCAN_REMOTE_REPO}" "${DB_CPPSCAN_DIR}" "${DB_CPPSCAN_SOURCE_DIR}"
checkExitCode $? "setup db.cppscan"
printlog "-----Setup db.cppscan successfully"

printlog "+++++Start to setup kws"
#bash ./kws.sh
bash ./jobSetup.sh "${KWS_REPO}" "${KWS_DIR}" "${KWS_SOURCE_DIR}"
checkExitCode $? "setup kws"
printlog "-----Setup kws successfully"

printlog "++++++Start to setup audiomentations"
bash ./jobSetup.sh "${AUDIOMENTATIONS_REPO}" "${AUDIOMENTATIONS_DIR}" "${AUDIOMENTATIONS_SOURCE_DIR}"
checkExitCode $? "setup audiomentations"
printlog "------Setup audiomentations sucessfully"