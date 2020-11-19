#!/bin/bash

# Generate a repo with some branches, merges and work done in it
# so we can see what happens

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# set environmental variables for subscripts
export GIT_EXPERIMENTING_LAST_BRANCH="master"

$DIR/create-branch.sh
$DIR/create-work-on-branch.sh
$DIR/merge-branch-with-master.sh
$DIR/create-branch.sh
$DIR/create-work-on-branch.sh
$DIR/switch-to-master.sh
$DIR/create-work-on-branch.sh
$DIR/switch-to-previous-branch.sh
$DIR/create-work-on-branch.sh
$DIR/switch-to-master.sh
$DIR/merge-branch-with-master.sh
# $DIR/create-branch.sh
# $DIR/create-work-on-branch.sh
# $DIR/switch-to-master.sh
# $DIR/create-work-on-branch.sh
# $DIR/switch-to-previous-branch.sh
# $DIR/rebase-branch-with-master.sh

