FROM ubuntu:trusty
MAINTAINER "Tasso Evangelista" <tasso@tassoevan.me>

ARG UID

ENV EMSO_URL=http://www.enq.ufrgs.br/alsoc/download/emso/bin-linux/emso-academic-beta-linux2-x86_64-0.10.8.tar.gz

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        wget \
        libfox-1.6-0 \
        libumfpack5.6.2 \
        libcairomm-1.0-1 \
        libboost-system1.54.0
RUN wget -O emso.tar.gz "$EMSO_URL"
RUN tar xvf emso.tar.gz && \
    mv emso /opt/emso && \
    rm emso.tar.gz

RUN useradd -u "$UID" -U -m developer

CMD /opt/emso/bin/emso
