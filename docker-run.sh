docker-kill.sh jenkins
docker run -dt -v /var/run/docker.sock:/var/run/docker.sock:rw -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:5000 jenkins-perform
