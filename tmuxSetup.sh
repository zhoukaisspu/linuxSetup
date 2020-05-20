#!/bin/bash
# Enable the screen-256color for tmux

. ./common/common.sh

COLOR_SETTING="set -g default-terminal \"screen-256color\""
CONFIG_FILE="${HOME}/.tmux.conf"

if [ ! -d ${CONFIG_FILE} ];then
	touch ${CONFIG_FILE}
fi

grep -q "${COLOR_SETTING}" ${CONFIG_FILE}

#if file contains the color settings string, return directly
if [[ $? -eq 0 ]]; then
	exit 0
fi

# add color setting to tmux configuration file
echo ${COLOR_SETTING} >> ${CONFIG_FILE}
