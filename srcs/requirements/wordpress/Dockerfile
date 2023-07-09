FROM alpine:3.17.4

ARG DB_NAME DB_USER DB_PASS WP_USER WP_EMAIL WP_PASS WP_USER2 WP_EMAIL2 WP_PASS2

RUN apk add --no-cache php php-fpm php-phar php81-mysqli php81-iconv \
	php81-mbstring mariadb-client php81-zip unzip && rm -rf /var/cache/apk/*

COPY tools/setup.sh /usr/local/bin/setup.sh

EXPOSE 9000

CMD ["/bin/sh", "/usr/local/bin/setup.sh"]
