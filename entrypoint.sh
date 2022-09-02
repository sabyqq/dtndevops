#!/bin/sh

sed -i 's|80|8080|' /etc/nginx/nginx.conf

set -m
nginx -g 'daemon off;' &
node app.js &

fg %1
