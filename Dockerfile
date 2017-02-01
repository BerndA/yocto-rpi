FROM debian:jessie

RUN sudo apt-get update && sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 pip3 pexpect

