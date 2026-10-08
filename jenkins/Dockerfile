FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends docker.io docker-cli python3 curl \
    && rm -rf /var/lib/apt/lists/*

RUN jenkins-plugin-cli --plugins workflow-aggregator git credentials-binding

COPY jenkins/init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

ENV PATH="/usr/bin:${PATH}"

USER jenkins
