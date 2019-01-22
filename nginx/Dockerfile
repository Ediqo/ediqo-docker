FROM nginx:latest

# Environment variables (with defaults)
ENV WEBROOT "/app/web"
ENV VIRTUAL_HOST "example.net"
ENV FPM_HOST "app-fpm"

# copy assets into Docker image
COPY ./nginx/assets /

RUN chmod 755 /etc/nginx/conf.d/* \
    && chown root:root /etc/nginx/conf.d/* \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && mkdir -p /app

# container is intended to be run behind a proxy, internally we go over port 80
EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
