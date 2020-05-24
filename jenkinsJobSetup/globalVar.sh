#!/bin/bash
# Define global variables used in jenkins job setup related

export DEPLOY_DIR_BASE="${HOME}/jenkinsJob"
export LOCAL_REPO_NAME="localRepo"
export CPPSCAN_DIR="${DEPLOY_DIR_BASE}/cppscan.git"
export CPPSCAN_SOURCE_DIR="${DEPLOY_DIR_BASE}/cppscan"
#export CPPSCAN_REMOTE_REPO="https://github.com/zhoukaisspu/job.cppscan.git"
export CPPSCAN_REMOTE_REPO="https://github.com/zhoukaisspu/linuxSetup.git"
