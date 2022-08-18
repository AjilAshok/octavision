#  $GITHUB_RUN_NUMBER
 file="lib/constant/version.dart"
echo file.version
echo $GITHUB_RUN_NUMBER >>file.version
echo 'helo world'>>file
version==$GITHUB_RUN_NUMBER
echo $version
output='$command'


