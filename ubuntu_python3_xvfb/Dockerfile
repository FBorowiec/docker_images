FROM ubuntu:focal

LABEL name=ubuntu_python3
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update \
  && apt -y install --no-install-recommends python3 python3-distutils python3-apt xvfb xserver-xephyr tigervnc-standalone-server xfonts-base \
  && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["/bin/bash"]
