#!/bin/sh

nginx -g daemon off & \
node app.js & \
psql

