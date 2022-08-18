#  $GITHUB_RUN_NUMBER
 file="lib/constant/version.dart"
echo $GITHUB_RUN_NUMBER
echo $GITHUB_RUN_NUMBER >>file.version
echo 'helo world'>>file
output='$command'
# echo $output
eval $output
# file.version=$GITHUB_RUN_NUMBER
# echo ${{file.version}}

