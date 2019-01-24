FROM jwilder/nginx-proxy

RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 200m;'; \
    } > /etc/nginx/conf.d/zz-custom.conf
