#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

#install java 
sudo apt install openjdk-17-jre -y

#install jenkins
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y 


#enable JENKINS

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
