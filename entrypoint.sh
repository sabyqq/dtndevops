#!/bin/bash

set -m

nginx -g 'daemon off;' &

node app.js &

su postgres -c '/usr/bin/postmaster -D /var/lib/pgsql/data'

fg %1
