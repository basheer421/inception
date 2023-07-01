#!/bin/sh
# https://codingwithmanny.medium.com/custom-wordpress-docker-setup-8851e98e6b8
mkdir -p /usr/share/webapps/

cd /usr/share/webapps/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown -R nginx /usr/share/webapps/
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
