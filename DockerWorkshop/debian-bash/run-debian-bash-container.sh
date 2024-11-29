#!/bin/sh

docker pull debian:bookworm
docker run --rm -d --name cdl-debian-bash debian:bookworm /usr/bin/sleep infinity
