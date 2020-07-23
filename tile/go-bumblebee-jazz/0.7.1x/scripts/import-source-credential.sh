#!/bin/bash

# Input for access token, user name to import credential into CodeBuild
GIT_ACCESS_TOKEN=$1
GITHUB_USER=$2

aws codebuild import-source-credentials \
    --server-type GITHUB \
    --auth-type PERSONAL_ACCESS_TOKEN \
    --token $GIT_ACCESS_TOKEN \
    --username $GITHUB_USER