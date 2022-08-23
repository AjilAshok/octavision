#!/bin/bash
echo $GITHUB_RUN_NUMBER
githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME


echo $githubnumber
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"
sed -i "s/Versionnumber/$githubnumber/g" lib/constant/version.dart



 