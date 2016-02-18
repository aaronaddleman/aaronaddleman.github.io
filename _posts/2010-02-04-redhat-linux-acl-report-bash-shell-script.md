---
layout: post
title: "RedHat Linux ACL report bash shell script"
description: ""
tags: [system]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


## Summary

Finally the day has arrived where I had to make a script to build an report for the access control list attributes on all of the files on my web server. I decided to use bash because it was easy for me to do and for compatibility of future releases of RedHat. I would have much rather have done it in Python or Ruby, but ohwell. By no means is this script really complete. I have to admit that it needs better testing of the input arguments and the debugging messages are pretty bad. I wrote this script in under 1 hour. I will do better as time proceeds, but for now, it got the job done.
My script does the following:

* takes two arguments
  * the path to start looking for directories
  * the file name for the report
* builds a header with date and time of report
  * finds the users and groups and counts the amount of times they appear in the report for a summary
  * appends the full report of all the files with the ACL

Ideas for the next version:

* Prompting of cleaning up world writable files
* Storing ACL for each file into a database for tracking history
* Do you have any ideas? If so, please let me know and maybe I will add them to the next version.

## And now, here is the script:

(for anyone who wishes to <a href="/assets/files/gen_acl_report.sh.zip">gen_acl_report.sh</a>)

{% highlight bash %}
    #!/bin/bash

    # purpose: create ACL report on 1 level depth directories and output to text file report
    # usage: ./gen_acl_report.sh start_path report
    # the above command will generate a file called "report_20100203_YYYYMMDD_HHMMSS.txt"

    # created by: aaron
    # created at: 20100203

    # debug flag
    DEBUG="on"

    # debug function
    function DEBUG()
    {
    [ "$DEBUG" == "on" ] &amp;&amp; $@ || :
    }

    # set path to find files
    STARTPATH="$1"

    # set report output
    REPORT="$2_`date +%Y%m_%H%M%S`.txt"

    # set temp report file
    ACLFILELIST=/tmp/acl_file_list.txt

    DEBUG echo "REPORT is = $REPORT"
    DEBUG echo "ACLFILELIST is = $ACLFILELIST"
    DEBUG echo "STARTPATH is = $STARTPATH"

    # build acl list
    function reportHeader
    {
    DEBUG echo "...inside function reportHeader"
    echo "ACL REPORT" &gt;&gt; $REPORT
    echo "Started on `date`" &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of function reportHeader"
    }

    function getACL
    {
    DEBUG echo "...inside function getACL"
    # find all files excluding .svn
    #find $STARTPATH -path '*.svn' -prune -o -type f -exec getfacl {} \; &gt; $ACLFILELIST
    # find all top level directories
    DEBUG echo "executing find $1"
    find $STARTPATH -maxdepth 1 -path '*\.svn' -prune -o -type d -exec getfacl {} \; &gt; $ACLFILELIST
    DEBUG echo "...end of function getACL"
    }

    function groupsSummary
    {
    DEBUG echo "...inside function groupsSummary"
    echo "===================================" &gt;&gt; $REPORT
    echo "Group Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^group:[a-zA-Z]" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Default Group Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^default:group:[a-zA-Z]" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Users for each group:" &gt;&gt; $REPORT
    for a in `cat $ACLFILELIST | grep "^group:[a-zA-Z]" | sort | awk -F: '{print $2}' | uniq`
    do
    echo $a &gt;&gt; $REPORT
    for g in `cat /etc/group | grep $a`
    do
    echo $g | awk -F: '{print "\t"$4}' &gt;&gt; $REPORT
    done
    done
    echo " " &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Users for each default group:" &gt;&gt; $REPORT
    for a in `cat $ACLFILELIST | grep "^default:group:[a-zA-Z]" | sort | awk -F: '{print $3}' | uniq`
    do
    echo $a &gt;&gt; $REPORT
    for g in `cat /etc/group | grep $a`
    do
    echo $g | awk -F: '{print "\t"$4}' &gt;&gt; $REPORT
    done
    done
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of function groupsSummary"
    }

    function usersSummary
    {
    DEBUG echo "...inside function usersSummary"
    echo "===================================" &gt;&gt; $REPORT
    echo "User Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^user:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Default User Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^default:user:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of function usersSummary"
    }

    function maskSummary
    {
    DEBUG echo "...inside function maskSummary"
    echo "===================================" &gt;&gt; $REPORT
    echo "Mask Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^mask:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Default Mask Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^default:mask:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of function maskSummary"
    }

    function findGroups
    {
    DEBUG echo "...finding list of groups"
    cat $ACLFILELIST | grep group:
    }

    function otherSummary
    {
    DEBUG echo "...inside function otherSummary"
    echo "===================================" &gt;&gt; $REPORT
    echo "Other Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^other:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "Default Other Summary:" &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "^default:other:" | sort | uniq -c &gt;&gt; $REPORT
    echo " " &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of function otherSummary"
    }

    function listofFiles
    {
    DEBUG echo "...list of files"
    echo "===================================" &gt;&gt; $REPORT
    echo "List of files" &gt;&gt; $REPORT
    cat $ACLFILELIST | grep "# file: " &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of list of files"
    }

    function appendACL
    {
    DEBUG echo "...appending acl contents"
    echo "===================================" &gt;&gt; $REPORT
    echo "ACL list of files" &gt;&gt; $REPORT
    cat $ACLFILELIST &gt;&gt; $REPORT
    echo "===================================" &gt;&gt; $REPORT
    DEBUG echo "...end of acl contents appending"
    }

    function removeACL
    {
    DEBUG echo "...removing temp files for ACL"
    rm $ACLFILELIST
    DEBUG echo "...removing temp files for ACL done"
    }

    reportHeader
    getACL
    groupsSummary
    usersSummary
    maskSummary
    otherSummary
    listofFiles
    appendACL
    findGroups

    removeACL
{% endhighlight %}
