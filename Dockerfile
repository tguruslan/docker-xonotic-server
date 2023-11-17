FROM ubuntu:22.04
RUN apt-get update \
    && apt-get install -y wget unzip

ENV GAME_URL="https://dl.xonotic.org/xonotic-0.8.6.zip"

VOLUME /srv/Xonotic
VOLUME /root/.xonotic/data

RUN mkdir -p /root/.xonotic/data
ADD start.sh /bin/start_xonotic.sh


EXPOSE 26000

CMD /bin/start_xonotic.sh
