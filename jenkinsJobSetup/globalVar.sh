#!/bin/bash
# Define global variables used in jenkins job setup related

export DEPLOY_DIR_BASE="${HOME}/jenkinsJob"
export LOCAL_REPO_NAME="localRepo"

export CPPSCAN_DIR="${DEPLOY_DIR_BASE}/job.cppscan.git"
export CPPSCAN_SOURCE_DIR="${DEPLOY_DIR_BASE}/job.cppscan"
export CPPSCAN_REMOTE_REPO="https://${githubUserName}:${githubToken}@github.com/zhoukaisspu/job.cppscan.git"

export DB_CPPSCAN_DIR="${DEPLOY_DIR_BASE}/db.cppscan.git"
export DB_CPPSCAN_SOURCE_DIR="${DEPLOY_DIR_BASE}/db.cppscan"
export DB_CPPSCAN_REMOTE_REPO="https://${githubUserName}:${githubToken}@github.com/zhoukaisspu/db.cppscan.git"
