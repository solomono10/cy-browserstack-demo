#!/bin/bash
PAGE=$1
FEATURE_FILES=$2
BROWSER=$3

npm i
npx cypress run --env PAGE=$PAGE \
                --spec $FEATURE_FILES \
                --browser $BROWSER
                --headless