#!/bin/bash

# setup cron to backup databases according to CRON_INTERVAL env variable
cd /usr/local
crontab -l > tempcrons
echo "$CRON_INTERVAL /usr/local/bin/mysqldump-wrapper.sh >> /var/log/cron/general.log 2>&1" >> tempcrons
crontab tempcrons
rm tempcrons

echo "installed cronjobs: \n"

crontab -l
