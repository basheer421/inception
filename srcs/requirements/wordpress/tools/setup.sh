#!/bin/sh

mkdir -p /var/www/html/
cd /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm latest.tar.gz
cd wordpress
mv wp-config-sample.php wp-config.php
sed -i "s/'Your database name'/'$DB_NAME'/g" wp-config.php
sed -i "s/'The created username'/'$DB_USER'/g" wp-config.php
sed -i "s/'The password you set'/'$DB_PASS'/g" wp-config.php
rm index.php
echo "hello world" > index.html
