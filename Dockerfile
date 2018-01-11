FROM alpine:3.7

ADD . /app

RUN apk update \
  && apk add --virtual build-dependencies \
    build-base \
    gcc \
    wget \
    git \
    curl-dev \
  && apk add \
    bash \
  && cd /app/SRC \
    && make cleanall \
    && make

VOLUME /app/RAWDATA
VOLUME /app/USERS
VOLUME /app/LOGS

ENV PORT 1024

USER root
EXPOSE 1024

CMD ["/app/docker-entrypoint.sh"]
