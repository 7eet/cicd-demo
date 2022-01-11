#!/bin/bash
DBNAME=$(aws ssm get-parameters --region ap-south-1 --names /DB/NAME --with-decryption --query Parameters[0].Value)
DBPSSWD=$(aws ssm get-parameters --region ap-south-1 --names /DB/PSSWD --with-decryption --query Parameters[0].Value)
SERVICEURL=$(aws ssm get-parameters --region ap-south-1 --names /SERVICE/DUMMYURL --with-decryption --query Parameters[0].Value)

length=${#DBNAME}

DBNAME=${DBNAME:1:$(($length-2))}

length=${#DBPSSWD}

DBPSSWD=${DBPSSWD:1:$(($length-2))}

length=${#SERVICEURL}

SERVICEURL=${SERVICEURL:1:$(($length-2))}

echo "DBNAME is ${DBNAME}"
echo "DBPSSWD is ${DBPSSWD}"
echo "SERVICEURL is ${SERVICEURL}"

cd /home/ubuntu
npm install pm2 -g
npm i