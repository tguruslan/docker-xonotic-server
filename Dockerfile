FROM ubuntu:22.04
RUN apt-get update && apt-get install -y wget unzip

RUN useradd -ms /bin/bash xonotic && chown -R xonotic:xonotic /home/xonotic

USER xonotic
ENV HOME /home/xonotic
RUN cd /home/xonotic \
    && wget https://download.evil-ant-colony.org/xonotic/xonotic-0.8.6.zip \
    && unzip /home/xonotic/xonotic-0.8.6.zip \
    && rm -f /home/xonotic/xonotic-0.8.6.zip \
    && mkdir -p /home/xonotic/.xonotic/data \
    && cp /home/xonotic/Xonotic/server/server_linux.sh Xonotic \
    && cp /home/xonotic/Xonotic/server/server.cfg /home/xonotic/.xonotic/data/ \
    && sed -i -e "s|//net_address|net_address|g" -e "s|//port|port|g" /home/xonotic/.xonotic/data/server.cfg

EXPOSE 26000
CMD /home/xonotic/Xonotic/server_linux.sh
