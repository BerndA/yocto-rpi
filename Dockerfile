FROM debian:jessie

RUN apt-get update && apt-get -y install bash gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python-pexpect locales

RUN useradd -ms /bin/bash yocto_build

ADD . /home/yocto_build/

RUN [ "echo", "en_US.UTF-8 > /etc/locale.gen" ]

ENV LANG=en_US.UTF-8

USER yocto_build
WORKDIR /home/yocto_build

RUN [ "bash", "-c", "source yocto/oe-init-build-env ./build && bitbake core-image-minimal"]


