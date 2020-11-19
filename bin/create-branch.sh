#!/bin/bash

BRANCH_PREFIX="feature"
currentBranchName=$(git branch --show-current | sed "s/ /_/" | sed "s&/&_&")

# @returns 0 on success, 128 on failure
function checkIfBranchExists() {
    branchName="$1"
    # This Git command came from:
    # https://stackoverflow.com/questions/5167957/is-there-a-better-way-to-find-out-if-a-local-git-branch-exists
    git rev-parse --verify "${branchName}" > /dev/null 2>&1
    return $?
}

function create_name() {
    counter=1
    while true; do
        newBranchName="${BRANCH_PREFIX}-${counter}"
        checkIfBranchExists "$newBranchName"
        if [ $? -gt 0 ]; then
            return
        fi
        counter=$(($counter+1))
    done
}

newBranchName=""
create_name
echo "New branch name is: ${newBranchName}"
# create branch and check it out
git checkout -b "$newBranchName"