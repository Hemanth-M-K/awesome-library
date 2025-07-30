#!/bin/bash
echo "Hello, World!"
name="Alice"
echo "My name is $name."
# get current branch
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

echo "BRANCH_NAME - $BRANCH_NAME."
 
# search jira issue ("ABC-123") id in a pattern such a "some/feature/ABC-123-description"
JIRA_ID=$(echo $BRANCH_NAME | sed -nE 's/([a-z]+\/)+([A-Z]+-[0-9]+)-.+/\2/p')

echo "JIRA_ID - $JIRA_ID."
 
# only prepare commit message if pattern matched and JIRA_ID was found
if [[ ! -z $JIRA_ID ]]; then
echo "Found JIRA ID: $JIRA_ID"
# $1 is the name of the file containing the commit message
sed -i.bak -e "1s/^/[$JIRA_ID] - /" $1
fi