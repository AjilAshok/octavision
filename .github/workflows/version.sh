#!/bin/bash
echo $GITHUB_RUN_NUMBER
githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME


echo $githubnumber

echo $Date
sed -i "s/Versionnumber/$githubnumber/g" lib/constant/version.dart
sed -i "s/Date/$date/g" lib/constant/version.dart



 