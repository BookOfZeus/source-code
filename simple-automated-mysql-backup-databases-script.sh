#!/bin/bash

# Create the file: /path/to/script/mysqlbackup.sh
# chmod +x /path/to/script/mysqlbackup.sh
#

#
# Config
#

now=$(date +%Y/%m/%d)
fileName=$(date +%H-%M)

dbUser=root
dbPass=
dbHost=`hostname`

if [ "$1" == "" ]; then
    dbDatabase="--all-databases"
else
    dbDatabase="--databases $1"
fi

backupFolder="/backup/db/$now/"

#
# End Config
#

if [ ! -e "$backupFolder" ]; then
    mkdir -p "$backupFolder"
fi

if [ "$dbPass" != "" ]; then
    dbPass="-p=$dbPass"
fi

#
# Functions
#
/usr/bin/mysqldump -u$dbUser $dbPass -h$dbHost $dbDatabase | bzip2 > $backupFolder$fileName.bz2
