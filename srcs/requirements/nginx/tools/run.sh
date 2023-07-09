#!/bin/sh
openssl \
    req -x509 \
    -nodes \
    -subj "/CN=${DOMAIN_NAME}}" \
    -addext "subjectAltName=DNS:${DOMAIN_NAME}" \
    -days 365 \
    -newkey rsa:2048 -keyout /etc/self-signed.key \
    -out /etc/self-signed.crt

mkdir -p /run/nginx;
nginx -g 'daemon off;'
