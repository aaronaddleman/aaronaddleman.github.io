---
layout: post
title: "No frills shell script to backup multiple environments with a database dump"
description: "While working on a project related to Expression Engine, I created a small shell script to allow backing up of the various environments. This script is bare bones simple and just gets the job done. Nothing fancy here."
tags: [ee]
image:
  feature: abstract-6.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true
---

{% highlight bash %}
  #!/usr/bin/env bash
  # usage:
  # 
  # ./backup_ee.sh (dev|prod|stage)
  function backup_site () {
    echo "mkdir -p $backup_dir"
    archive_name=`basename $backup_file`
    echo "Archiving: $1 ($backup_file to $backup_dir/$archive_name)"
    echo "tar pzcvf $backup_dir/$archive_name.tar --totals $backup_file"
    echo "Compressing: $1 ($backup_file to $backup_dir/$archive_name)"
    echo "gzip $backup_dir/$archive_name.tar"
    echo "mysqldump -u $backup_db_user -p$backup_db_pass $backup_dv > $backup_dir/$backup_db.sql"
  }
  function site () {
    case $1 in
      dev )
      #backup dev
      backup_file="/var/www/dev"
      backup_db="db_name"
      backup_db_user="db_user"
      backup_db_pass="db_pass"
      backup_site
        ;;
      prod )
      #backup prod
      backup_file="/var/www/prod"
      backup_db="db_name"
      backup_db_user="db_user"
      backup_db_pass="db_pass"
      backup_site
        ;;
      stage )
      #backup stage
      backup_file="/var/www/stage"
      backup_db="db_name"
      backup_db_user="db_user"
      backup_db_pass="db_pass"
      backup_site
        ;;
    esac
  }
  # get backup selection from input
  backup_selection=$1
  # set backup destination
  backup_dir="/home/path/to/backups/$backup_selection/`date +%Y-%m-%d-%H-%M-%S`"
  # execute backup
  site $backup_selection
{% endhighlight %}