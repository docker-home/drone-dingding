#!/bin/sh

NOTICE_COLOR=''

if [ ! -z "${DING_DING_WEBHOOK_URL}" ]
then
  if [ ! -z "${PLUGIN_START}" ]
  then
    DING_MESSAGE="\`<${DRONE_BUILD_LINK}|${DRONE_BUILD_NUMBER}>\` build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> started"
  else

    if [ "${DRONE_BUILD_STATUS}" = "success" ]
    then
      DING_MESSAGE="\`<${DRONE_BUILD_LINK}|${DRONE_BUILD_NUMBER}>\` build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> completed"
      NOTICE_COLOR='good'
    else
      DING_MESSAGE="\`<${DRONE_BUILD_LINK}|${DRONE_BUILD_NUMBER}>\` build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> failed"
      NOTICE_COLOR='danger'
    fi

  fi
  curl -X POST -H 'Content-Type: application/json' -d "{'msgtype':'text','text':{'content':'${DING_MESSAGE}'}}" ${DING_DING_WEBHOOK_URL}
else
  echo "There is no DING_DING_WEBHOOK_URL environment variable"
fi
