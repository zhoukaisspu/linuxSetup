#!/bin/bash
# It will clone the automation job from remote server and 
# deploy these into host machine.

CURRENT_DIR=$(dirname $0)
cd "${CURRENT_DIR}"

source ../common/common.sh
source ./globalVar.sh

printlog "Current Dir:  ${CURRENT_DIR}"

printlog "Start to remove cppscan repo from host"
if [[ -d "${KWS_DIR}" ]]; then
	rm -R -f  "${KWS_DIR}"
fi
checkExitCode $? "rm db.cppscan folder"
printlog "Remove ${KWS_DIR} successfully"

printlog "Start to remove db.cppscan source folder from host"
if [[ -d "${KWS_SOURCE_DIR}" ]]; then
	rm -R -f "${KWS_SOURCE_DIR}"
fi
checkExitCode $? "rm db.cppscan folder"
printlog "Remove ${KWS_SOURCE_DIR} successfully"

printlog "Start to create ${KWS_DIR} folder"
mkdir -p "${KWS_DIR}"
checkExitCode $? "create ${KWS_DIR} folder"
printlog "Create ${KWS_DIR} successfully"

printlog "Start to create ${KWS_SOURCE_DIR} folder"
mkdir -p "${KWS_SOURCE_DIR}"
checkExitCode $? "create ${KWS_SOURCE_DIR} folder"
printlog "Create ${KWS_SOURCE_DIR} successfully"


printlog "Start to init db.cppscan bare repo"
cd "${KWS_DIR}"
git init --bare
checkExitCode $? "init db.cppscan bare repo"
printlog "Init db.cppscan bare repo successfully"

printlog "Start to clone db.cppscan from remote server"
cd "${KWS_SOURCE_DIR}"
git clone "${KWS_REPO}" .
checkExitCode $? "clone db.cppscan repo"
printlog "clone db.cppscan repo successfully"

printlog "Start to push db.cppscan to local bare repo"
git remote add "${LOCAL_REPO_NAME}" "${KWS_DIR}"
git push "${LOCAL_REPO_NAME}" master
printlog "Push db.cppscan to local repo successfully"

