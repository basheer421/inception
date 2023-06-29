FROM alpine:3.17.4

RUN apk update && apk add mariadb mariadb-client

COPY tools/setup.sh /usr/local/bin/

EXPOSE 3306

CMD ["/usr/local/bin/setup.sh"]
