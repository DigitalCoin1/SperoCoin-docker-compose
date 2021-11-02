FROM ubuntu:16.04

RUN mkdir /coin

RUN apt-get update && apt-get install wget build-essential libboost-all-dev libcurl4-openssl-dev \
        libdb5.3-dev libdb5.3++-dev libminiupnpc-dev qrencode libqrencode-dev \
        git libtool automake autotools-dev autoconf pkg-config \
        libssl-dev libgmp3-dev libevent-dev bsdmainutils unzip nano cron supervisor -y \
  && mkdir -p /var/log/supervisor \
  && cd /coin \
  && mkdir data \
  && git clone https://github.com/DigitalCoin1/SperoCoin \
  && cd /coin/SperoCoin/src \
  && make -f makefile.unix \
  && strip SperoCoind \
  && cp SperoCoind /usr/local/bin \
  && cd /coin

COPY sperocoin.conf /coin

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /coin

CMD ["/usr/bin/supervisord"]
