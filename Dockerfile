FROM alpine:edge

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

RUN apk update

RUN apk add --no-cache mongodb

RUN mkdir /data
RUN mkdir /data/db

COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod", "--quiet", "--bind_ip", "0.0.0.0", "|", "grep", '-Ev', '"conn1|conn2|init"' ]
