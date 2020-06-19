#!/bin/bash
# It will clone the automation job from remote server and
# deploy these into host computer.
# It can imporve the jenkins performance, since jenkins have to
# clone the job and execute it.

CURRENT_DIR=$(dirname $0)
cd "${CURRENT_DIR}"

source ../common/common.sh
source ./globalVar.sh

printlog "Current Dir:  ${CURRENT_DIR}"

printlog "Start to remove cppscan repo from host"
if [[ -d "${CPPSCAN_DIR}" ]]; then
	rm -R -f  "${CPPSCAN_DIR}"
fi
checkExitCode $? "rm cppscan folder"
printlog "Remove ${CPPSCAN_DIR} successfully"

printlog "Start to remove cppscan source folder from host"
if [[ -d "${CPPSCAN_SOURCE_DIR}" ]]; then
	rm -R -f "${CPPSCAN_SOURCE_DIR}"
fi
checkExitCode $? "rm cppscan folder"
printlog "Remove ${CPPSCAN_SOURCE_DIR} successfully"

printlog "Start to create ${CPPSCAN_DIR} folder"
mkdir -p "${CPPSCAN_DIR}"
checkExitCode $? "create ${CPPSCAN_DIR} folder"
printlog "Create ${CPPSCAN_DIR} successfully"

printlog "Start to create ${CPPSCAN_SOURCE_DIR} folder"
mkdir -p "${CPPSCAN_SOURCE_DIR}"
checkExitCode $? "create ${CPPSCAN_SOURCE_DIR} folder"
printlog "Create ${CPPSCAN_SOURCE_DIR} successfully"


printlog "Start to init cppscan bare repo"
cd "${CPPSCAN_DIR}"
git init --bare
checkExitCode $? "init cppscan bare repo"
printlog "Init cppscan bare repo successfully"

printlog "Start to clone cppscan from remote server"
cd "${CPPSCAN_SOURCE_DIR}"
git clone "${CPPSCAN_REMOTE_REPO}" .
checkExitCode $? "clone cppscan repo"
printlog "clone cppscan repo successfully"

printlog "Start to push cppscan to local bare repo"
git remote add "${LOCAL_REPO_NAME}" "${CPPSCAN_DIR}"
git push "${LOCAL_REPO_NAME}" master
printlog "Push cppscan to local repo successfully"

