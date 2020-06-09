FROM ubuntu:focal

LABEL name=jenkins_bazel
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update \
    && apt -y install --no-install-recommends gnupg2 \
    && apt -y install --no-install-recommends curl wget g++ systemctl git ca-certificates bash

# Installing Bazel with the Java sdk version 8
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
    && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && apt -y update && apt -y install --no-install-recommends bazel \
    && apt -y install --no-install-recommends openjdk-11-jdk openjdk-8-jdk \
    && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> .bashrc

# Installing Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add - \
    && echo "deb https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list \
    && apt -y update && apt -y install --no-install-recommends jenkins

VOLUME /var/jenkins_home

# Clearing cache to keep image small
RUN apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Exposing port 8080 on host for Jenkins
EXPOSE 8080

ENTRYPOINT ["/bin/systemctl", "start", "jenkins"]
CMD ["/bin/bash"]
