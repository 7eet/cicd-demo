#!/bin/bash
aws ssm get-parameter     --name /DB/NAME
cd /home/ubuntu
npm install pm2 -g
npm i