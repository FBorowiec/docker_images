FROM ubuntu:focal

LABEL name=ubuntu_python3
LABEL version=1.0

ARG DEBIAN_FRONTEND=noninteractive

# curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get -y update
# sudo apt-get remove libpq5
# sudo apt-get install libpq-dev

# RUN apt -y update \
#   && apt -y install --no-install-recommends software-properties-common \
#   && add-apt-repository ppa:deadsnakes/ppa \
#   && apt -y update \
#   && apt -y install libpq-dev python3.10-dev python3.10-distutils \
#   && apt -y purge software-properties-common \
#   && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN ln -s /usr/bin/python3 /usr/bin/python

# sudo apt-get install libpq5=12.9-0ubuntu0.20.04.1 && sudo apt-get install libpq-dev

CMD ["/bin/bash"]
RUN apt -y update \
  && apt -y install --no-install-recommends python3 python3-distutils \
  && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["/bin/bash"]
