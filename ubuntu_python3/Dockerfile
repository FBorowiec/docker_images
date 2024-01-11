FROM ubuntu:22.04

# Labels
LABEL name=ubuntu_python3
LABEL version=1.0
LABEL maintainer="FBorowiec"

# Block root access
RUN chsh -s /usr/sbin/nologin root

# Create foobar user
ARG USER=foobar
RUN groupadd -r $USER && useradd -r -g $USER $USER

# Install python3
ARG DEBIAN_FRONTEND=noninteractive
RUN apt -y update \
    && apt -y install --no-install-recommends python3.10 python3-distutils ca-certificates netcat \
    && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Symbolic link for python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Change to user
USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]
