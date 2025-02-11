FROM ubuntu:22.04


RUN apt update

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /perpetual-storage

COPY ./run.sh /run.sh

WORKDIR /
CMD ["bash", "/run.sh"]
