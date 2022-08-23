#!/bin/bash
echo $GITHUB_RUN_NUMBER
githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME


echo $githubnumber

datetime=$(date '+%d-%m-%Y')
echo $datetime
time=$(%r)
echo $time


sed -i "s/Versionnumber/$githubnumber/g" lib/constant/version.dart
sed -i "s/Date/$datetime/g" lib/constant/version.dart



 