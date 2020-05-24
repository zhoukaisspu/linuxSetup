#!/bin/bash

printlog() {
	DATETIME=$(date)
	echo "${DATETIME}** $1"
}

checkExitCode() {
	if [[ $? -ne 0 ]]; then
		printlog "<Error>: Task ($2) failed with code $1"
		exit $1
	fi
}

getScriptAbsolutePath() {
	_PATH=$(dirname $0)
	cd "${_PATH}"
	echo $(pwd)
}
