#!/bin/bash
apt update -y
apt install ruby-full -y
apt install wget -y
cd ~
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
if  sudo service codedeploy-agent status | grep -q 'active (running)'; then
  echo "Code Deploy Agent Running"
else
    sudo service codedeploy-agent start
fi