FROM jenkins-perform:alpine

USER root
RUN apk update
RUN apk upgrade
RUN apk --update add docker busybox-suid
RUN adduser jenkins users
USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Xmx512m -Dit.dockins.dockerslaves.spi.DockerDriver.verbose=true"
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
RUN /usr/local/bin/install-plugins.sh docker-build-publish blueocean amazon-ecs docker-slaves amazon-ecr
