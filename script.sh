#!/bin/bash
PATH=$1
FEATURE_FILES=$2

echo "Hello $FIRSTNAME $LASTNAME"
npm i
echo "-----------------------"
echo $(node --version)
echo "+++++++++++++++++++++++"
CYPRESS_PATH=$PATH npx cypress run --spec $FEATURE_FILES