FROM debian:12

RUN apt-get update \
 && apt-get install -y sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

# Install dependencies
RUN sudo apt update && apt install -y \
    curl sudo gnupg unzip wget \
    && rm -rf /var/lib/apt/lists/*

# Install CloudPanel
RUN sudo curl -sSL https://installer.cloudpanel.io/ce/v2/install.sh | sudo bash

# Expose ports
EXPOSE 8443

# Start CloudPanel on container run
CMD ["/usr/sbin/init"]

