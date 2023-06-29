#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
echo "[mysqld]" > /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
rc-service mariadb starts
rc-update add mariadb default
if [ ! -d "/var/lib/mysql/wordpress" ]; then
  mysql -uroot  -e \
  "CREATE DATABASE $DB_NAME;"
  mysql -uroot  -e "GRANT ALL PRIVILEGES ON *.* TO \
 '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;"
fi
mysqld --user=mysql
