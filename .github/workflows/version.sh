#  $GITHUB_RUN_NUMBER
 file="lib/constant/version.dart"
echo $GITHUB_RUN_NUMBER
echo $GITHUB_RUN_NUMBER >>file.version
cat >file.version <<'stop'
# echo ${{file.version}}

