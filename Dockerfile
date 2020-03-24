FROM arm32v6/alpine:3.11.5
LABEL maintainer="github.com/robertbeal"

ENV VERSION 1.2.4

WORKDIR /tmp

RUN apk add --update --no-cache --virtual=build-dependencies \ 
        wget \ 
        tar \
    && wget --no-check-certificate https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}_linux_armhf.tar.gz -O influxdb.tar.gz \
    && tar -xzf influxdb.tar.gz \
    && mv influxdb-${INFLUXDB_VERSION}-1/usr/bin/* /bin \
    && apk del --purge build-dependencies \
    && rm -rf /tmp/* \
    && addgroup -S influxdb \
    && adduser -h /data -G influxdb -S influxdb

USER influxdb
EXPOSE 8083 8086
