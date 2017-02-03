FROM debian:jessie

RUN apt-get update && apt-get -y install bash gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python-pexpect locales

RUN useradd -ms /bin/bash yocto_build

ADD . /home/yocto_build/

ENV LOCALE="en_US.UTF-8"

RUN echo ${LOCALE} > /etc/locale.gen && locale-gen
RUN locale -a && cat /etc/locale.gen 

ENV LANG=${LOCALE}

USER yocto_build
WORKDIR /home/yocto_build
