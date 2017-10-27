#!/bin/bash -xe
yum update -y
yum install -y docker git
usermod -a -G docker ec2-user
service docker start
chkconfig docker on
