FROM ubuntu:focal

LABEL name=ubuntu_bazel
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update \
    && apt -y install --no-install-recommends gnupg2 \
    && apt -y install --no-install-recommends curl g++ systemctl git ca-certificates bash \
    && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Installing Bazel with the Java sdk version 8
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
    && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && apt -y update && apt -y install --no-install-recommends bazel \
    && apt -y install --no-install-recommends openjdk-8-jdk \
    && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> .bashrc \
    && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt purge -y curl && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
