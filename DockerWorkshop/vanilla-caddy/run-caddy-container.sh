#!/bin/sh

docker pull caddy:latest
docker run --rm -d --name cdl-caddy -p 9090:80 caddy:latest
