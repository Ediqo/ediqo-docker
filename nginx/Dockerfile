FROM nginx:latest

# Environment variables (with defaults)
ENV WEBROOT=/app/web
ENV VIRTUAL_HOST=example.net
ENV FPM_HOST=app-fpm

# nginx configuration template with placeholders (substituted with ENV vars runtime)
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
