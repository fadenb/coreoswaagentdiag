FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
    openssl \
    ca-certificates \
    ssh \
    parted \
    sudo \
    net-tools \
    ifupdown \
    python \
    python-pyasn1 \
    python-rpm \
    libicu55 \
    libglibmm-2.4-1v5 \
    apt-utils \
    libxml2 \
    dmidecode \
    git \
    rsyslog && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY omi-1.0.8-3.universald.1.x64.deb /root/
COPY scx-1.6.2-104.universald.1.x64.deb /root/
COPY systemctl /bin/systemctl
COPY docker-waagent.conf /etc/waagent.conf

RUN git clone https://github.com/Azure/WALinuxAgent.git && \
    cd WALinuxAgent && \
    git checkout WALinuxAgent-2.0.15 && \
    cp waagent /usr/sbin/

RUN chmod +x /usr/sbin/waagent && \
    rm -rf /etc/skel && \
    ln -sf /dev/stdout /var/log/waagent.log

RUN dpkg --install --force-confold --force-confdef omi-1.0.8-3.universald.1.x64.deb && \
    dpkg --install --force-confold --force-confdef scx-1.6.2-104.universald.1.x64.deb
    
    
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT /entrypoint.sh

COPY entrypoint.sh /entrypoint.sh

