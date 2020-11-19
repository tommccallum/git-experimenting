#!/bin/bash

if [ "x$GIT_EXPERIMENTING_LAST_BRANCH" == "x" ]; then
    echo " ! Cannot merge as no branch specified"
    exit 128
fi

echo "Merging branch '${GIT_EXPERIMENTING_LAST_BRANCH}' with master"
git merge "$GIT_EXPERIMENTING_LAST_BRANCH"