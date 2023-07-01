FROM alpine:3.17.4

RUN apk add --no-cache nginx && rm -rf /var/cache/apk/*

EXPOSE 80

COPY tools/run.sh /usr/local/bin/run.sh
COPY conf/default.conf /etc/nginx/http.d/

CMD ["/bin/sh", "/usr/local/bin/run.sh"]
