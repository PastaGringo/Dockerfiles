FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m johndoe && echo "johndoe:johndoe" | chpasswd && adduser johndoe sudo

USER johndoe
CMD /bin/bash
