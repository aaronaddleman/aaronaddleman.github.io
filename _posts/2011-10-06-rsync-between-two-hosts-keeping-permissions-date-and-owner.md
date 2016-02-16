---
layout: post
title: "Rsync between two hosts keeping permissions date and owner"
description: ""
tags: [cli]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Every now and then I turn to rsync to save me from copying files when I looking to do the job more than once. I love how there are so many options for rsync. I also hate that there are so many options for rsync because the right combination can make or break my day. I recently wrote a script that I feel is the best one yet for myself. This script is need of major clean up as I bet it can be done with better functions. But it is serving its purpose for now:

{% highlight bash %}
    #!/bin/bash
    # sync directories between servers with paramaters
    # sites dir
    SITESDIR="/var/www/sites"
    # rsync identity
    RSYNCIDENT="ssh -q -i /home/rsync/.ssh/id_rsa"
    # remote host to sync from
    REMOTEHOST="remote.hostname.com"
    # site choice from first arg
    ARGSITE=$1
    case $ARGSITE in
    site1)
    message="syncing $ARGSITE"
    cmd="update_site site1.domain.com ${SITESDIR}/site1.domain.com/htdocs"
    ;;
    site2)
    message="syncing $ARGSITE"
    cmd="update_site site2.domain.com ${SITESDIR}/site2.domain.com/htdocs"
    ;;
    *)
    message="could not match site"
    ;;
    esac
    function update_site {
    echo "${message}"
    # set field breaker 
    IFS=$'\n'
    dirlist=()
    # build the array with files in the root directory
    for a in `ssh -i /home/rsync/.ssh/id_rsa rsync@www.domain.com "find /var/www/sites/$1/htdocs -maxdepth 1"`
    do
    dirlist=("${dirlist[@]}" "$a")
    done
    # loop through the array of files
    for b in ${dirlist[@]}
    do
    # if we have a path that ends with "htdocs", pass over it because its the root folder
    if [[ $b =~ htdocs$ ]]; then
    echo "..-.. skipping htdocs"
    else
    echo "..+.. syncing $b"
    # use rsync with some arguments to copy from remote source to local destination
    # 
    # explanation of arguments:
    # 
    # -P, show a progress for transfering files
    # -arzogtp, archive and preserve owner and group values with permissions
    # -s, protect arguments for files with spaces
    # -e, command to be executed for grabing remote files
    /usr/bin/rsync -arzogtp -s -e "$RSYNCIDENT" rsync@www.domain.com:$b "$2"
    fi
    done
    }
    # execute the command that has been defined by the case statement above
    $cmd
{% endhighlight %}
