#!/bin/bash

APPLICATION_NAME=$1
CODEBUILD_JSON_FILE=$2
roleArn=`cat role.arn`



echo "Deleting ${APPLICATION_NAME} from CodeBuild ..."
aws codebuild delete-project --name ${APPLICATION_NAME}-service-build || true
echo "Done."
sleep 5

echo "Re-creating ${APPLICATION_NAME} into CodeBuild ..."
aws codebuild create-project \
    --cli-input-json file://${CODEBUILD_JSON_FILE} \
    --service-role ${APPLICATION_NAME}   
echo "Done." 
sleep 5

echo "Activing webhook on Github with all events ..."
aws codebuild create-webhook \
    --project-name ${APPLICATION_NAME}-service-build \
    --filter-groups '[[{"type": "EVENT", "pattern": "PUSH", "excludeMatchedPattern": false},{"type":"FILE_PATH","pattern": "/", "excludeMatchedPattern": false}]]'
echo "Done." 




