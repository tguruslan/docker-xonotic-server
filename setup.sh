#!/usr/bin/env bash

# docker build -t xonotic-server .
docker rm xonotic-server
docker run -d \
    -p 26000:26000/udp \
    --name=xonotic-server \
    --restart=unless-stopped \
    xonotic-server
