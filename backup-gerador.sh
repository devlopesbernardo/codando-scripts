#!/bin/bash

backup_dir=$(date +'%d.%m.%Y')
echo ${backup_dir}

mysql -N -e 'show databases' | while read dbname; do mysqldump --complete-insert --routines --triggers --single-transaction "$dbname" >"$dbname".sql; done

rsync --rsync-path="mkdir -p /codandosonhos/${backup_dir}/sql/ && rsync" --archive --human-readable --update --rsh ssh ./*.sql root@66.23.194.42:/codandosonhos/${backup_dir}/sql/

rsync --rsync-path="mkdir -p /codandosonhos/${backup_dir}/data/ && rsync" --archive --human-readable --update --rsh ssh /var/www/ root@66.23.194.42:/codandosonhos/${backup_dir}/data/

rm -rf *.sql
