#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

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
sed -i "s/'localhost'/'mariadb'/g" wp-config.php
# rm index.php
echo "hello world" > index.html

sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf
echo 'listen.owner = nobody' >> /etc/php81/php-fpm.d/www.conf
echo 'listen.group = nobody' >> /etc/php81/php-fpm.d/www.conf

# ADD ENV VARS
wp --allow-root --path=/var/www/html/wordpress core install --url="bammar.42.fr" \
   --title="WordPress" --admin_user=$DB_USER --admin_password=$DB_PASS \
   --admin_email="bush@bush.bush"

# ADD ENV VARS
wp user create man "bush2@bush.bush" --role=author --user_pass=123

php-fpm81 --nodaemonize