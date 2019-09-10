#!/bin/bash

# backup databases using mysqldump

database=$MYSQL_DATABASE
user=$MYSQL_USER

export MYSQL_PWD=$MYSQL_PASSWORD
mysqldump --single-transaction -u $user $database > /backups/$(date +%F)-$database.sql | head
