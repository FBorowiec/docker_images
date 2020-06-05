FROM ubuntu:latest

RUN apt -y update && apt-get install -y gnupg2
RUN apt -y install curl wget g++ systemctl git

RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt -y update && apt -y install bazel && apt -y install openjdk-11-jdk openjdk-8-jdk
RUN echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> .bashrc

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list
RUN apt -y update
RUN apt -y install jenkins

RUN apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080

ENTRYPOINT ["top", "-b"]
CMD ["systemctl start jenkins"]
