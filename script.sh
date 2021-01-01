#!/bin/bash

FEATURE_FILES=$1
echo "Hello $FIRSTNAME $LASTNAME"
npm i
echo "-----------------------"
echo $(node --version)
echo "+++++++++++++++++++++++"
npx cypress run --spec $FEATURE_FILES