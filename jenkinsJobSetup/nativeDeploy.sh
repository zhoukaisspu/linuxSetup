#!/bin/bash
# It will clone the automation job from remote server and
# deploy these into host computer.
# It can imporve the jenkins performance, since jenkins have to
# clone the job and execute it.

source ../common/common.sh
source ./globalVar.sh

printlog "Start to remove cppscan repo from host"
if [[ -d "${CPPSCAN_DIR}" ]]; then
	rm -R "${CPPSCAN_DIR}"
fi
checkExitCode $? "rm cppscan folder"
printlog "Remove ${CPPSCAN_DIR} successfully"

printlog "Start to create ${CPPSCAN_DIR} folder"
mkdir -p "${CPPSCAN_DIR}"
checkExitCode $? "create ${CPPSCAN_DIR} folder"
printlog "Create ${CPPSCAN_DIR} successfully"
