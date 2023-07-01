FROM alpine:3.16

RUN apk add --no-cache php8-common php8-session \
    php8-iconv php8-json php8-gd php8-curl php8-xml \
    php8-mysqli php8-imap php8-cgi fcgi php8-pdo \
    php8-pdo_mysql php8-soap php8-posix \
    php8-gettext php8-ldap php8-ctype \
    php8-dom php8-simplexml && rm -rf /var/cache/apk/*

COPY tools/setup.sh /usr/local/bin/setup.sh

CMD ["/bin/sh", "/usr/local/bin/setup.sh"]
