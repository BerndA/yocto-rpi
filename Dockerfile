FROM debian:jessie

ADD . /opt/yocto

RUN apt-get update && apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 pip3 pexpect

RUN whoami

RUN cd /opt/yocto/ && source yocto/oe-init-build-env ./build && bitbake core-image-minimal

