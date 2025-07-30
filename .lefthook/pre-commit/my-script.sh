#!/bin/bash
 
# get current branch
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
 
# search jira issue ("ABC-123") id in a pattern such a "some/feature/ABC-123-description"
JIRA_ID=$(echo $BRANCH_NAME | sed -nE 's/([a-z]+\/)+([A-Z]+-[0-9]+)-.+/\2/p')
 
# only prepare commit message if pattern matched and JIRA_ID was found
if [[ ! -z $JIRA_ID ]]; then
# $1 is the name of the file containing the commit message
sed -i.bak -e "1s/^/[$JIRA_ID] - /" $1
fi