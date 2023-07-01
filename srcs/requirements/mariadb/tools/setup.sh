#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
  mysql -uroot  -e \
  "CREATE DATABASE $DB_NAME;"
  mysql -uroot  -e "GRANT ALL PRIVILEGES ON *.* TO \
 '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;"
fi
mysqld --user=mysql
