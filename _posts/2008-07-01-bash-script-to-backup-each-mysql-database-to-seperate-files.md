---
layout: post
title: "Bash script to backup each mysql database to separate files"
description: ""
tags: [scripts]
image:
  feature: 8160262732_04666c38b1_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


## Summary

If you are looking for a script written to backup your mysql databases to individual files seperated by date then the code below will help you out. Keep in mind that the script has been designed to run on a daily basis. All files under the backup directory are stamped with day and time to keep from writing over your old backups. Each time the script is executed, it looks for any directory that is older than the retention period variable. This allows for keeping your partition slice from over flowing. I might incorporate some type of size detection, but that might be for a future release of this script.

## the script

{% highlight bash %}
    #!/bin/sh
    # backup all mysql databases to /usr/sqlbackup/YYYYMMDD/databasename.sql files
    echo "=== starting mysqlbackup.sh on `$curDate` ==="
    todayDate=`/bin/date +%Y%m%d-%H%M%S`
    curDate="/bin/date +%Y%m%d-%H%M%S"
    backupDirectory="/usr/sqlbackup/`/bin/date +%Y%m%d`"
    dbList=`/usr/bin/mysql -u root -pSECRET -Bse 'show databases'`
    mysqlDump="/usr/bin/mysqldump --user="root" --password=SECRET"
    # mkdir for backup files
    echo "** testing existance of backup directory of ${backupDirectory}"
    if [ -d $backupDirectory ] ; then
      echo "**+ backup directory of ${backupDirectory} exists"
      echo "**+ skipping command to create backup directory"
      else
      echo "**+ backup directory of ${backupDirectory} does not exists"
      echo "**+ creating backup directory"
      mkdir -p $backupDirectory
    fi
    # test if backup directory exists
    if [ -d $backupDirectory ] ; then
      echo ""
      else
      echo "!!! backup directory does not exist !!! aborting backup process !!!"
      exit 1
    fi
    # start dump
    echo "**** starting mysqldump cmd of all databases on `$curDate`"
    for db in $dbList
    do
      echo "***** starting dump of database $db"
      $mysqlDump $db &gt; $backupDirectory/$db.sql
      echo "***** end dump of database $db"
    done
    # look for files in archive directory and remove any that are older than 12*24hrs from current date of script starting
    echo "**** looking for files older than (12*24hrs) from `$curDate`"
    for file in "$( /usr/bin/find /usr/sqlbackup -type f -mtime +12 )"
    do
      echo "****** removing files older than `$curDate`"
      /bin/rm -f $file
    done
    echo "**** end of looking for files older than 12 days"
    echo "=== end mysqldump script on `$curDate` ==="
    exit 0
{% endhighlight %}