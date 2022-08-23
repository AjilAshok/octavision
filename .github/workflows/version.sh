#!/bin/bash
echo $GITHUB_RUN_NUMBER
githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME


echo $githubnumber
sed -i 's/AJIL/githubnumber/g' lib/constant/version.dart



 