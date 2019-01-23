FROM mariadb:latest

# Environment variables (with defaults)
ENV CRON_INTERVAL "0 3 * * *"
ENV MYSQL_ROOT_PASSWORD "super_secret_123"
ENV DATABASES "app_db"
ENV DATABASE_USER "db_user"
ENV DATABASE_PASSWORD "user_secret_123"

# copy assets into Docker image
COPY ./mariadb/assets /

# set file ownership / permissions, install cron and supervisord packages
RUN chmod -R 0755 /docker-entrypoint-initdb.d && \
    chown -R root:root /docker-entrypoint-initdb.d && \
    chmod 0640 /etc/mysql/conf.d/extra.cnf && \
    chown root:root /etc/mysql/conf.d/extra.cnf && \
    chmod +x /usr/local/bin/*.sh && \
    apt-get update && \
    apt-get install -y cron supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /var/log/cron && \
    mkdir -p /backups && \
    rm -rf /var/cache/*

EXPOSE 3306

# add own entrypoint, which calls standard mariadb entrypoint as well
ENTRYPOINT ["/usr/local/bin/ediqo_entrypoint.sh"]

# start supervisord as the main process of the container
CMD ["/usr/bin/supervisord", "-c", "/usr/local/supervisor.conf"]
