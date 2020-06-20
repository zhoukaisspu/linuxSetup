#!/bin/bash
# It will clone the automation job from remote server and 
# deploy these into host machine.

CURRENT_DIR=$(dirname $0)
cd "${CURRENT_DIR}"

source ../common/common.sh
source ./globalVar.sh

printlog "Current Dir:  ${CURRENT_DIR}"

printlog "Start to remove cppscan repo from host"
if [[ -d "${DB_CPPSCAN_DIR}" ]]; then
	rm -R -f  "${DB_CPPSCAN_DIR}"
fi
checkExitCode $? "rm db.cppscan folder"
printlog "Remove ${DB_CPPSCAN_DIR} successfully"

printlog "Start to remove db.cppscan source folder from host"
if [[ -d "${DB_CPPSCAN_SOURCE_DIR}" ]]; then
	rm -R -f "${DB_CPPSCAN_SOURCE_DIR}"
fi
checkExitCode $? "rm db.cppscan folder"
printlog "Remove ${DB_CPPSCAN_SOURCE_DIR} successfully"

printlog "Start to create ${DB_CPPSCAN_DIR} folder"
mkdir -p "${DB_CPPSCAN_DIR}"
checkExitCode $? "create ${DB_CPPSCAN_DIR} folder"
printlog "Create ${DB_CPPSCAN_DIR} successfully"

printlog "Start to create ${DB_CPPSCAN_SOURCE_DIR} folder"
mkdir -p "${DB_CPPSCAN_SOURCE_DIR}"
checkExitCode $? "create ${DB_CPPSCAN_SOURCE_DIR} folder"
printlog "Create ${DB_CPPSCAN_SOURCE_DIR} successfully"


printlog "Start to init db.cppscan bare repo"
cd "${DB_CPPSCAN_DIR}"
git init --bare
checkExitCode $? "init db.cppscan bare repo"
printlog "Init db.cppscan bare repo successfully"

printlog "Start to clone db.cppscan from remote server"
cd "${DB_CPPSCAN_SOURCE_DIR}"
git clone "${DB_CPPSCAN_REMOTE_REPO}" .
checkExitCode $? "clone db.cppscan repo"
printlog "clone db.cppscan repo successfully"

printlog "Start to push db.cppscan to local bare repo"
git remote add "${LOCAL_REPO_NAME}" "${DB_CPPSCAN_DIR}"
git push "${LOCAL_REPO_NAME}" master
printlog "Push db.cppscan to local repo successfully"

