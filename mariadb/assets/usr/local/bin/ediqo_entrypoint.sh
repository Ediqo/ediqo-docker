#!/bin/bash

# run crontab installer (install cron jobs for backups)
/usr/local/bin/install-cronjob.sh

# run mariadb standard entrypoint
/docker-entrypoint.sh

# start supervisord as the main process of the container
/usr/bin/supervisord -c /usr/local/supervisor.conf
