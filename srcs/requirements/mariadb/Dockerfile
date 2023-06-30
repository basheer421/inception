FROM alpine:3.17.4

ARG DB_NAME DB_USER DB_PASS

RUN apk add --no-cache mariadb mariadb-client \
	&& rm -rf /var/cache/apk/* \
	&& mysql_install_db --verbose --datadir=/var/lib/mysql;

EXPOSE 3306

COPY conf/my.cnf /etc/my.cnf

CMD ["mysqld", "--user=root"]

