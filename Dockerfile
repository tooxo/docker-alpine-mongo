FROM alpine:edge

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories \
 && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

RUN apk update \
 && apk add dumb-init \
 && apk add --no-cache mongodb

RUN mkdir /data \
 && mkdir /data/db

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD mongod --bind_ip 0.0.0.0 | grep -Ev "conn|init"
