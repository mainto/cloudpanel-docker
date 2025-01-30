FROM debian:12

# Install dependencies
RUN apt update && apt install -y \
    curl sudo gnupg unzip wget \
    && rm -rf /var/lib/apt/lists/*

RUN echo "fs.file-max=65535" > /etc/sysctl.d/99-file-max.conf

# Install CloudPanel
RUN curl -sSL https://installer.cloudpanel.io/ce/v2/install.sh | bash

# Expose ports
EXPOSE 8443

# Start CloudPanel on container run
CMD ["/usr/sbin/init"]

