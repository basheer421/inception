FROM alpine:3.17.4

ARG DOMAIN_NAME

RUN apk add --no-cache nginx openssl && rm -rf /var/cache/apk/*

EXPOSE 443

COPY tools/run.sh /usr/local/bin/run.sh
COPY conf/default.conf /etc/nginx/http.d/

CMD ["/bin/sh", "/usr/local/bin/run.sh"]
