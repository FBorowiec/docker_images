FROM ubuntu:focal

LABEL name=ubuntu_python3
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update \
  && apt -y install --no-install-recommends python3 python3-distutils python3-apt python3-pip xvfb xserver-xephyr tigervnc-standalone-server xfonts-base wget \
  && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install pyvirtualdisplay pillow requests

COPY google-chrome-stable_96_amd64.deb .
RUN apt install -f -y ./google-chrome-stable_96_amd64.deb \
  && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["/bin/bash"]
