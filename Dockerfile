FROM python:3.5.4-alpine

EXPOSE 3141

RUN mkdir /var/cache/devpi

RUN apk add --update-cache \
  gcc \
  musl-dev \
  libffi-dev

RUN pip3 install devpi-server && \
  rm -rf /var/cache/apk/*

RUN chmod 777 /var/cache/devpi

ENV DEVPI_SERVERDIR=/var/cache/devpi

RUN devpi-server --init

VOLUME ['/var/cache/devpi']

CMD devpi-server \
  --host 0.0.0.0 --port 3141
