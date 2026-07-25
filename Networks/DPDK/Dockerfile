FROM debian:bookworm
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y build-essential
RUN apt-get install -y libtool
RUN apt-get install -y autoconf
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y cmake
RUN apt-get install -y apt-utils
RUN apt-get install -y net-tools
RUN apt-get install -y ebtables
RUN apt-get install -y bridge-utils
RUN apt-get install -y tcpdump
RUN apt-get install -y iproute2
RUN apt-get install -y iputils-ping
RUN apt-get install -y iputils-arping
RUN apt-get install -y arping
RUN apt-get install -y tshark
RUN apt-get install -y tcptraceroute
RUN apt-get install -y traceroute
RUN apt-get install -y inetutils-ping
RUN apt-get install -y inetutils-traceroute
RUN apt-get install -y inetutils-tools
RUN apt-get install -y inetutils-syslogd
RUN apt-get install -y inetutils-telnet
RUN apt-get install -y inetutils-telnetd
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcap-dev
RUN apt-get install -y libnuma-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-all
RUN apt-get install -y nginx
RUN apt-get install -y procps
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | sudo bash
