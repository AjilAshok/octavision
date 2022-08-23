#!/bin/bash

githubnumber=$GITHUB_RUN_NUMBER
echo $githubnumber


datetime=$(date '+%d-%m-%Y %r')
echo $datetime
buildnumber='1.2.7'



sed -i "s/Versionnumber/$buildnumber/g" lib/constant/version.dart
sed -i "s/Date/$datetime/g" lib/constant/version.dart
sed -i "s/buildnumber/$githubnumber/g" lib/constant/version.dart
set -e

file=$(cat pubspec.yaml)
# echo $file
BUILD_NAME=$(echo $file | sed -ne 's/[^0-9]*\(\([0-9]\.\)[0-9][^.]\).*/\1/p')
# echo $BUILD_NAME

BUILD_NUMBER=$(git rev-list HEAD --count)
echo $BUILD_NUMBER

echo "Building version ${BUILD_NAME} ${BUILD_NUMBER}"

# export BUILD_NAME="$BUILD_NAME"
# export BUILD_NUMBER="$BUILD_NUMBER"





 