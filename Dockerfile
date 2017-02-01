FROM debian:jessie

RUN apt-get update && apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python-pexpect

RUN useradd -ms /bin/bash yocto_build

ADD . /home/yocto_build/

USER yocto_build
WORKDIR /home/yocto_build

#RUN cd /opt/yocto/ && source yocto/oe-init-build-env ./build && bitbake core-image-minimal
RUN ["bash" "-c" "source yocto/oe-init-build-env ./build && bitbake core-image-minimal"]


