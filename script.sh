#!/bin/bash
BASE_URL=$1
PAGE=$2
FEATURE_FILES=$3
BROWSER=$4

npm i
# export CYPRESS_BASE_URL=$BASE_URL
# CYPRESS_BASE_URL=$BASE_URL npx cypress run --env PAGE=$PAGE \
#                 --spec $FEATURE_FILES \
#                 --browser $BROWSER \
#                 --headed \
#                 --config viewportWidth=1280,viewportHeight=720,video=false

browserstack-cypress run --sync \
                --env PAGE=$PAGE,baseUrl=$BASE_URL \
                --spec $FEATURE_FILES \
                --browser $BROWSER \
                --headless \
                --config viewportWidth=1280,viewportHeight=720,video=false
