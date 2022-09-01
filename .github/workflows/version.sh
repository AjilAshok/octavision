#!/bin/bash

githubnumber=$GITHUB_RUN_NUMBER
echo $githubnumber


D=$(date '+%d-%m-%Y %r')
echo $D
T=$(date +'%d\/%m\/%Y %H\:%M\:%S')
buildnumber='1.2.7'
echo $T


file=$(cat pubspec.yaml)

BUILD_NAME=$(echo $file | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p')

echo $BUILD_NAME
BUILD_TIME=$(date +'%d\/%m\/%Y %H\:%M\:%S')


sed -i "s/Versionnumber/$buildnumber/g" lib/constant/version.dart
# sed -i "s/Date/$D/g" lib/constant/version.dart
sed -i "s/buildnumber/$githubnumber/g" lib/constant/version.dart
sed -i "s/timeadded/$T/g" lib/constant/version.dart







 