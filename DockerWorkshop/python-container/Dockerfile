FROM ubuntu:22.04

# Required to prevent warnings
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt update && apt -y install python3

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/www

COPY ./index.html /var/www

WORKDIR /var/www
CMD ["/usr/bin/python3", "-m", "http.server",  "8888"]
