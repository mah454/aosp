FROM ubuntu:trusty 
MAINTAINER Mahdi Sheikh Hosseini <mah454@gmail.com> 

RUN dpkg --add-architecture i386 ; apt-get update 

COPY sources.list /etc/apt/

RUN apt-get update ; \ 
    apt-get install -y autoconf automake bc bison build-essential curl flex gcc gcc-4.8 gcc-4.8-aarch64-linux-gnu gcc-4.8-aarch64-linux-gnu-base gcc-4.8-arm-linux-gnueabihf \
    gcc-4.8-arm-linux-gnueabihf-base gcc-4.8-base:amd64 gcc-4.8-multilib gcc-4.8-multilib-arm-linux-gnueabihf gcc-aarch64-linux-gnu git gnupg gperf lib32stdc++6 \
    libaio-dev libbluetooth-dev libbrlapi-dev libbz2-dev libc6-dev libcap-dev libcap-ng-dev libcurl4-gnutls-dev libepoxy-dev libfdt-dev libgbm-dev libgl1-mesa-dev libgles2-mesa-dev \
    libglib2.0-dev libibverbs-dev libjpeg8-dev liblzo2-dev libncurses5 libncurses5-dev libncurses5-dev:i386 libnuma-dev librbd-dev librdmacm-dev libreadline6-dev:i386 libsasl2-dev \
    libsdl1.2-dev libsdl2-dev libseccomp-dev libsnappy-dev libssh2-1-dev libssl-dev libswitch-perl libtool libusb-1.0-0 libusb-1.0-0-dev libvde-dev libvdeplug-dev libvte-2.90-dev \
    libx11-dev:i386 libxen-dev libxml2-utils libxml-sax-expat-incremental-perl libxml-simple-perl make mingw32 python-markdown tofrodos valgrind x11proto-core-dev xfslibs-dev \
    xsltproc xutils-dev zip zlib1g-dev zlib1g-dev:i386

RUN apt-get install -y wget 

RUN wget -c "https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u382-b05/openlogic-openjdk-8u382-b05-linux-x64.tar.gz"

RUN tar -xvf openlogic-openjdk-8u382-b05-linux-x64.tar.gz -C /opt ; \
    mv /opt/openlogic-openjdk-8u382-b05-linux-x64/ /opt/openjdk ; \
    rm openlogic-openjdk-8u382-b05-linux-x64.tar.gz 

RUN echo 'export JAVA_HOME="/opt/openjdk"' >> /etc/bash.bashrc ; \
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/bash.bashrc

COPY entrypoint.sh / 


WORKDIR /aosp

CMD ["/entrypoint.sh"]

