#!/bin/bash

if [ "x$GIT_EXPERIMENTING_LAST_BRANCH" == "x" ]; then
    echo " ! Cannot switch as no branch specified"
    exit 128
fi

echo "Switching to branch '${GIT_EXPERIMENTING_LAST_BRANCH}'"
git switch "$GIT_EXPERIMENTING_LAST_BRANCH"