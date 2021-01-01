#!/bin/bash

FIRSTNAME=$1
LASTNAME=$2
echo "Hello $FIRSTNAME $LASTNAME"
npm i
echo "-----------------------"
echo 'node --version'
echo "+++++++++++++++++++++++"
npm run test