FROM alpine:3.17.4

ARG DB_NAME DB_USER DB_PASS

RUN apk add --no-cache php php-fpm php-phar php81-mysqli php81-iconv \
	php81-mbstring mariadb-client && rm -rf /var/cache/apk/*

COPY tools/setup.sh /usr/local/bin/setup.sh

EXPOSE 9000

CMD ["/bin/sh", "/usr/local/bin/setup.sh"]
