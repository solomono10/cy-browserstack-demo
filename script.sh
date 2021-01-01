#!/bin/bash
PAGE=$1
FEATURE_FILES=$2

npm i
echo "Node version: $(node --version)"
npx cypress run --env PAGE=$PAGE --spec $FEATURE_FILES