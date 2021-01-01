#!/bin/bash

FIRSTNAME=$1
LASTNAME=$2
echo "Hello $FIRSTNAME $LASTNAME"
npm i
echo node --version
npm run test