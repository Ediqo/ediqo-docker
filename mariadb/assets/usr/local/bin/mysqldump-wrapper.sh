#!/bin/bash

# backup databases using mysqldump

databases=$(echo $DATABASES | tr "," "\n")
user=$DATABASE_USER

for db in $databases
do
    export MYSQL_PWD=$DATABASE_PASSWORD
    mysqldump --single-transaction -u $user $db > /backups/$(date +%F)-$db.sql | head
done
