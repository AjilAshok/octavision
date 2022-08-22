
# echo "{name}={value}" >> $GITHUB_RUN_NUMBER
echo $GITHUB_RUN_NUMBER


 githubnumber=$GITHUB_RUN_NUMBER
echo $RUNNER_NAME
echo $i

echo $githubnumber
touch version.txt
mkdir version
touch "version/buildnumber.txt"
echo "helo ">>"version/buildnumber.txt"
echo "Created version/buildnumber.txt"



 