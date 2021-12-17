FROM ubuntu:16.04
MAINTAINER SperoCoin <helper@sperocoin.org>

RUN apt-get update && apt-get upgrade \
	&& apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libseccomp-dev libcap-dev libdb5.3-dev libdb5.3++-dev -y \
	&& apt-get install libboost-all-dev -y \
	&& apt-get install libminiupnpc-dev -y \
	&& apt-get install libzmq3-dev -y \
	&& apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y \
	&& apt-get install libqrencode-dev -y \
	&& apt-get install git nano wget -y \
	&& cd /root
	&& git clone --recursive https://github.com/DigitalCoin1/SperoCoin sperocoin \
	&& cd /root/sperocoin \
	&& ./autogen.sh \
	&& ./configure --with-incompatible-bdb \
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