#!/bin/bash
echo $GITHUB_RUN_NUMBER
githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME
echo $i

echo $githubnumber
sed -i 's/AJIL/ARUJ/g' lib/constant/version.dart



