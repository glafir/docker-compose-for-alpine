FROM docker:latest
ENV EDGE_MAIN http://dl-cdn.alpinelinux.org/alpine/edge/main &&\
    EDGE_COMMUNITY http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk update --repository=$EDGE_MAIN --repository=$EDGE_COMMUNITY &&\
    apk --no-cache add \
      curl \
      make \
      python3 \
      python3-dev \
      py3-pip \
      gcc libc-dev \
      libffi-dev \
      openssl-dev --repository=$EDGE_MAIN --repository=$EDGE_COM$ &&\
    pip3 --no-cache-dir install --upgrade pip &&\
    pip3 --no-cache-dir install docker-compose &&\
    rm -rf /var/cache/apk/ && rm -rf /root/.cache
CMD ["/bin/sh"]
