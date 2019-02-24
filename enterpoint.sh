#!/bin/sh

if [ ! -z "${DING_DING_WEBHOOK_URL}" ]
then
  if [ ! -z "${PLUGIN_START}" ]
  then
    DING_TITLE="build start ${DRONE_REPO}"
    DING_MESSAGE="[${DRONE_REPO}|${DRONE_BUILD_NUMBER}](${DRONE_BUILD_LINK}) build of [${DRONE_REPO_NAME}:${DRONE_BRANCH}](${DRONE_COMMIT_LINK}) start by ${DRONE_COMMIT_AUTHOR}"
  else
    if [ "${DRONE_BUILD_STATUS}" = "success" ]
    then
      DING_TITLE="build ${DRONE_BUILD_STATUS} ${DRONE_REPO}"
      DING_MESSAGE="[${DRONE_REPO}|${DRONE_BUILD_NUMBER}](${DRONE_BUILD_LINK}) build of [${DRONE_REPO_NAME}:${DRONE_BRANCH}](${DRONE_COMMIT_LINK}) ${DRONE_BUILD_STATUS} by ${DRONE_COMMIT_AUTHOR}"
    else
      DING_TITLE="build ${DRONE_BUILD_STATUS} ${DRONE_REPO}"
      DING_MESSAGE="[${DRONE_REPO}|${DRONE_BUILD_NUMBER}](${DRONE_BUILD_LINK}) build of [${DRONE_REPO_NAME}:${DRONE_BRANCH}](${DRONE_COMMIT_LINK}) ${DRONE_BUILD_STATUS} by ${DRONE_COMMIT_AUTHOR}"
    fi
  fi
  curl -X POST -H 'Content-Type: application/json' -d "{'msgtype':'markdown','markdown':{'title':'${DING_TITLE}','text':'${DING_MESSAGE}'}}" ${DING_DING_WEBHOOK_URL}
else
  echo "There is no DING_DING_WEBHOOK_URL environment variable"
fi
