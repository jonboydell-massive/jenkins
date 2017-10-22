FROM jonboydell/jenkins-alpine:v1.1.0

USER root
RUN apk update
RUN apk upgrade
RUN apk --update add docker busybox-suid
RUN adduser jenkins docker
USER jenkins

ENV JAVA_OPTS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false -Xmx512m -Dit.dockins.dockerslaves.spi.DockerDriver.verbose=true"
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
RUN /usr/local/bin/install-plugins.sh docker-build-publish amazon-ecs docker-slaves amazon-ecr
