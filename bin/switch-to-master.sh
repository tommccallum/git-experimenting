#!/bin/bash

# update our common environment variable
export GIT_EXPERIMENTING_LAST_BRANCH=$(git branch --show-current)

echo "Switching to master branch"
git switch master
