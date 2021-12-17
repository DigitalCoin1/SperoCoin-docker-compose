FROM ubuntu:18.04
MAINTAINER SperoCoin <helper@sperocoin.org>

RUN apt-get update && apt-get upgrade \
	&& apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libseccomp-dev libcap-dev -y \
	&& apt-get install software-properties-common \
	&& add-apt-repository ppa:bitcoin/bitcoin -y \
	&& apt-get update \
	&& apt-get install libdb4.8-dev libdb4.8++-dev \
	&& apt-get install libboost-all-dev -y \
	&& apt-get install libminiupnpc-dev -y \
	&& apt-get install libzmq3-dev -y \
	&& apt-get install git nano wget -y \
	&& cd /root
	&& git clone --recursive https://github.com/DigitalCoin1/SperoCoin sperocoin \
	&& cd /root/sperocoin \
	&& ./autogen.sh \
	&& ./configure \
	&& make \
	&& cp /root/sperocoin/src/SperoCoind /usr/bin \
	&& cp /root/sperocoin/src/SperoCoin-cli /usr/bin \
	&& cp /root/sperocoin/src/SperoCoin-tx /usr/bin

RUN mkdir /coin && \
	&& mkdir /coin/data \
	&& mkdir -p /var/log/supervisor \
	&& apt-get install supervisor

COPY sperocoin.conf /coin/data

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]