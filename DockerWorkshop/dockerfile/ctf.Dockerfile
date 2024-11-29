FROM debian:bookworm

RUN set -xe; \
    apt-get -yqq update; \
    apt-get -yqq install xinetd \
    ;

RUN useradd -m -d /home/ctf -s /bin/bash ctf
RUN mkdir /home/ctf/piece_of_pie
COPY flag /home/ctf
COPY public/piece_of_pie /home/ctf/piece_of_pie

RUN chown -R root:ctf /home/ctf
RUN chmod 750 /home/ctf
RUN chmod 750 /home/ctf/piece_of_pie
RUN chmod 750 /home/ctf/piece_of_pie/piece_of_pie
RUN chmod 440 /home/ctf/flag

COPY deploy/xinetd.conf /etc/xinetd.d/piece_of_pie

WORKDIR /
COPY deploy/run.sh /usr/local/bin/
CMD ["/usr/local/bin/run.sh"]
