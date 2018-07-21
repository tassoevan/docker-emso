FROM ubuntu:xenial
LABEL maintainer="Tasso Evangelista <tasso@tassoevan.me>"

ENV EMSO_URL=http://www.enq.ufrgs.br/alsoc/download/emso/bin-linux/emso-academic-beta-linux2-x86_64-0.10.9.tar.gz

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        wget \
        libboost-system1.58.0 \
        libcairomm-1.0-1v5 \
        libfox-1.6-0 \
        libumfpack5.7.1
RUN wget -O emso.tar.gz "$EMSO_URL"
RUN tar xvf emso.tar.gz && \
    mv emso /opt/emso && \
    rm emso.tar.gz

RUN useradd -U -m developer
USER developer

CMD usermod -u "$UID" developer && \
    /opt/emso/bin/emso
