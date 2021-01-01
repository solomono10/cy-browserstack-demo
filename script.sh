#!/bin/bash
PAGE=$1
FEATURE_FILES=$2

echo "Hello $FIRSTNAME $LASTNAME"
npm i
echo "-----------------------"
NODE_VERSION=$(node --version)
echo "Node version is $(node --version)"
echo "+++++++++++++++++++++++"
CYPRESS_PAGE=$PAGE npx cypress run --spec $FEATURE_FILES