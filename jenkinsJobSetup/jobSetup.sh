#!/bin/bash
# Templdate for jeknins job setup

CURRENT_DIR=$(dirname $0)
cd "${CURRENT_DIR}"

source ../common/common.sh
source ./globalVar.sh


printlog "Current Dir:  ${CURRENT_DIR}"
REMOTE_REPO="$1"
LOCAL_BARE_REPO="$2"
LOCAL_SOURCE_CODE="$3"


printlog "Start to remove ${LOCAL_BARE_REPO} repo from host"
if [[ -d "${LOCAL_BARE_REPO}" ]]; then
	rm -R -f  "${LOCAL_BARE_REPO}"
fi
checkExitCode $? "rm ${LOCAL_BARE_REPO} folder"
printlog "Remove ${LOCAL_BARE_REPO} successfully"

printlog "Start to remove ${LOCAL_SOURCE_CODE} folder from host"
if [[ -d "${LOCAL_SOURCE_CODE}" ]]; then
	rm -R -f "${LOCAL_SOURCE_CODE}"
fi
checkExitCode $? "rm ${LOCAL_SOURCE_CODE} folder"
printlog "Remove ${LOCAL_SOURCE_CODE} successfully"

printlog "Start to create ${LOCAL_BARE_REPO} folder"
mkdir -p "${LOCAL_BARE_REPO}"
checkExitCode $? "create ${LOCAL_BARE_REPO} folder"
printlog "Create ${LOCAL_BARE_REPO} successfully"

printlog "Start to create ${LOCAL_SOURCE_CODE} folder"
mkdir -p "${LOCAL_SOURCE_CODE}"
checkExitCode $? "create ${LOCAL_SOURCE_CODE} folder"
printlog "Create ${LOCAL_SOURCE_CODE} successfully"


printlog "Start to init ${LOCAL_BARE_REPO} bare repo"
cd "${LOCAL_BARE_REPO}"
git init --bare
checkExitCode $? "init ${LOCAL_BARE_REPO} bare repo"
printlog "Init ${LOCAL_BARE_REPO} bare repo successfully"

printlog "Start to clone ${REMOTE_REPO} from remote server"
cd "${LOCAL_SOURCE_CODE}"
git clone "${REMOTE_REPO}" .
checkExitCode $? "clone ${REMOTE_REPO} repo"
printlog "clone ${REMOTE_REPO} repo successfully"

printlog "Start to push ${LOCAL_SOURCE_CODE} to local bare repo"
git remote add "${LOCAL_REPO_NAME}" "${LOCAL_BARE_REPO}"
git push "${LOCAL_REPO_NAME}" master
printlog "Push ${LOCAL_SOURCE_CODE} to local repo successfully"

