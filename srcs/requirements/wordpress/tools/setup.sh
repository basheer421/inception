#!/bin/sh

mkdir -p /var/www/html/
cd /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm latest.tar.gz
cd wordpress
mv wp-config-sample.php wp-config.php
echo db: $DB_NAME
sed -i "s/'database_name_here'/'$DB_NAME'/g" wp-config.php
sed -i "s/'username_here'/'$DB_USER'/g" wp-config.php
sed -i "s/'password_here'/'$DB_PASS'/g" wp-config.php
# rm index.php
echo "hello world" > index.html

sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf
echo 'listen.owner = nobody' >> /etc/php81/php-fpm.d/www.conf
echo 'listen.group = nobody' >> /etc/php81/php-fpm.d/www.conf

php-fpm81 --nodaemonize