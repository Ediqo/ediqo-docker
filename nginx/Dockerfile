FROM nginx:latest

# nginx configuration template with placeholders
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /etc/nginx/conf.d/* \
    && chown root:root /etc/nginx/conf.d/* \
    && mkdir -p /app

# container startup script
COPY ./nginx/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# container runs behind proxy, only open port 80
EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
