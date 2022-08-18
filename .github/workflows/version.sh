#  $GITHUB_RUN_NUMBER
 file="lib/constant/version.dart"
echo $GITHUB_RUN_NUMBER
echo $GITHUB_RUN_NUMBER >>file.version=$GITHUB_RUN_NUMBER
# echo ${{file.version}}

