#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
  mysql -S /var/lib/mysql/mysql.sock -uroot -e \
  "CREATE DATABASE $DB_NAME;"
  mysql -S /var/lib/mysql/mysql.sock -uroot  -e "GRANT ALL PRIVILEGES ON *.* TO \
 '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;"
fi
mysqld --user=root --socket=/var/lib/mysql/mysql.sock
