#!/bin/sh

docker pull nginx:latest
docker run -d --restart always --name cdl-nginx -p 8080:80 nginx:latest
