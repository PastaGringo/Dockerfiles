FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m johndoe 
RUN mkdir /home/johndoe
RUN echo "johndoe ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER johndoe
CMD /bin/bash
