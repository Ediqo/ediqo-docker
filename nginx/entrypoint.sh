#!/bin/bash
set -e

echo "Creating nginx configuration from default template"
envsubst '$NGINX_WEBROOT $VIRTUAL_HOST $FPM_HOST' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf

# default behaviour is to launch nginx
if [[ -z ${1} ]]; then
  echo "Starting nginx..."
  exec $(which nginx) -c /etc/nginx/nginx.conf -g "daemon off;"
else
  exec "$@"
fi
