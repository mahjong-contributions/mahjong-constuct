#!/bin/bash

# Create secrets into Secret Manager
# Name for the secret
SECRET_NAME=$1
APP_REPO_USER=$2
APP_REPO=$3
APP_REPO_BRANCH=$4
APP_CONF_REPO_USER=$5
APP_CONF_REPO_ACCESS_TOKEN=$6
APP_CONF_REPO=$7
APP_CONF_REPO_BRANCH=$8
KMS_KEY_ID=$9


aws secretsmanager get-secret-value --secret-id $SECRET_NAME
if [ $? -eq '0' ]
then
    aws secretsmanager update-secret --secret-id $SECRET_NAME \
        --secret-string '{"appRepoUser":"'$APP_REPO_USER'", "appRepo":"'$APP_REPO'", "appRepoBranch":"'$APP_REPO_BRANCH'", "appConfRepoUser":"'$APP_CONF_REPO_USER'", "appConfRepoAccessToken":"'$APP_CONF_REPO_ACCESS_TOKEN'", "appConfRepo":"'$APP_CONF_REPO'", "appConfRepoBranch":"'$APP_CONF_REPO_BRANCH'"}'

else 
    aws secretsmanager create-secret --name $SECRET_NAME \
        --secret-string '{"appRepoUser":"'$APP_REPO_USER'", "appRepo":"'$APP_REPO'", "appRepoBranch":"'$APP_REPO_BRANCH'", "appConfRepoUser":"'$APP_CONF_REPO_USER'", "appConfRepoAccessToken":"'$APP_CONF_REPO_ACCESS_TOKEN'", "appConfRepo":"'$APP_CONF_REPO'", "appConfRepoBranch":"'$APP_CONF_REPO_BRANCH'"}'
    # aws secretsmanager create-secret --name $SECRET_NAME \
    #     --kms-key-id $KMS_KEY_ID \
    #     --secret-string '{"githubUser":"'$GITHUB_USER'", "accessToken":"'$ACCESS_TOKEN'", "appConfRepo":"'$APP_CONF_REPO'"}'

fi 
