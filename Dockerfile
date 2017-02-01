FROM debian:jessie

ADD . /opt/yocto

RUN apt-get update && apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python-pexpect

RUN whoami

RUN cd /opt/yocto/ && source yocto/oe-init-build-env ./build && bitbake core-image-minimal

