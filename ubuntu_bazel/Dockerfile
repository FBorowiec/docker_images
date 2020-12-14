FROM ubuntu:focal

LABEL name=ubuntu_bazel
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update \
    && apt -y install --no-install-recommends gnupg2 \
    && apt -y install --no-install-recommends curl wget g++ systemctl git ca-certificates bash zsh python3 python3-distutils python3-apt \
    && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Installing Bazel with the Java sdk version 8
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
    && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && apt -y update && apt -y install --no-install-recommends bazel \
    && apt -y install --no-install-recommends openjdk-8-jdk \
    && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> .bashrc \
    && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# terminal colors with xterm
ENV TERM xterm
# set the zsh theme
ENV ZSH_THEME murilasso

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN sed -i 's/ZSH_THEME=.*/ZSH_THEME="murilasso"/' ~/.zshrc \
    && sed -i 's/plugins=(.*)/plugins=(bazel docker docker-compose docker-machine git zsh-navigation-tools)/' ~/.zshrc

RUN git config --global user.email "franek.borowiec@gmail.com" \
    && git config --global user.name "Franek Borowiec"

RUN apt purge -y curl && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /home

CMD ["zsh"]
