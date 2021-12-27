#!/bin/bash

ipAddressOfEc2=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=CICDPractice" --query "Reservations[*].Instances[*].PublicIpAddress"   --output=text)

apiUrl="http://${ipAddressOfEc2}:8000/api/"

responseCode=$(curl -sL -w "%{http_code}\\n" "${apiUrl}" -o responseGeneratedFromCurl.txt)

rm responseGeneratedFromCurl.txt

if [ $responseCode -eq 200 ]
then
        echo ">>> Success <<<"
else
        echo ">>> Failue <<<"
fi
