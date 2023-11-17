#!/bin/env bash

if [[ ! -f "/srv/Xonotic/server_linux.sh" ]]; then
    if [[ ! -f "/srv/xonotic.zip" ]]; then
        wget ${GAME_URL} -O /srv/xonotic.zip
    fi
    unzip /srv/xonotic.zip -d /srv
    rm -f /srv/xonotic.zip
    cp /srv/Xonotic/server/server_linux.sh /srv/Xonotic/
fi
if [[ ! -f "/root/.xonotic/data/server.cfg" ]]; then
    cp /srv/Xonotic/server/server.cfg /root/.xonotic/data/
    sed -i -e "s|//net_address|net_address|g" -e "s|//port|port|g" /root/.xonotic/data/server.cfg
fi

/srv/Xonotic/server_linux.sh