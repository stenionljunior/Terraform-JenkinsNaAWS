#!/bin/bash

sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker container run --name jenkins -d --restart=always -p 8080:8080 -p 50000:50000 -u 0 -v jenkins_home:/var/jenkins_home jenkins/jenkins:latest