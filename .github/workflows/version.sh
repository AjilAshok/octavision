#!/bin/bash

githubnumber=$GITHUB_RUN_NUMBER
echo $githubnumber

datetime=$(date '+%d-%m-%Y %r')
echo $datetime
buildnumber='1.2.7'



sed -i "s/Versionnumber/$githubnumber/g" lib/constant/version.dart
sed -i "s/Date/$datetime/g" lib/constant/version.dart
sed -i "s/buildnumber/$buildnumber/g" lib/constant/version.dart



 