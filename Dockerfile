FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo build-essential irssi irssi-dev libglib2.0-dev libssl-dev cmake git 

RUN useradd -m johndoe
RUN echo "johndoe ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER johndoe
WORKDIR /home/johndoe

RUN git clone https://github.com/falsovsky/FiSH-irssi.git \
	cd FiSH-irssi \
    cmake -DCMAKE_BUILD_TYPE=Release . \
    make \
	make install \
	mkdir /home/johndoe/.irssi \
	echo "load /usr/local/lib/irssi/modules/libfish.so" >> /home/johndoe/.irssi/startup

CMD ["irssi"]
