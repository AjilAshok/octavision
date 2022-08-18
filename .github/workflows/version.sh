#  $GITHUB_RUN_NUMBER
 file="lib/constant/version.dart"
echo file.version
echo $GITHUB_RUN_NUMBER >>file.version
echo 'helo world'>>file
output='$command'
# echo $output
file.version==output
echo file.version
# file.version=$GITHUB_RUN_NUMBER
# echo ${{file.version}}

