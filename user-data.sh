#!/bin/bash -xe
yum update -y
yum install -y docker
service docker start
chkconfig docker on
docker run -dt -v /var/run/docker.sock:/var/run/docker.sock:rw -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:5000 jenkins:latest