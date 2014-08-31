---
layout: post
title: "Verifying all entries in /etc/shells are not more permissive than 755"
description: ""
tags: [uncategorized]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I wanted to make sure that all the files listed in /etc/shells were not more permissive than 755, but I kept running into a problem of trying to analyze the permissions on a file that is a link. After digging around, I found out about a command called

    readlink

which prints the full path of the file that the link is point at. So I came up with some bash shell code to do the job:

## Bash Script checking permissions

{% highlight bash %}
    for f in `cat /etc/shells`
    do
      #echo "checking $f"
      if [ -e $f ]; then
        if [ -L $f ]; then
          f=`readlink -f $f`
          results=`stat -c "%a" $f`
        else
          results=`stat -c "%a" $f`
        fi
        if [[ "$results" -le "755"  ]]; then
          echo "--- passed =&gt; $results - $f"
        else
          echo "-X- Failed =&gt; $results - $f"
        fi
      else
        echo "missing"
      fi
    done
{% endhighlight %}

## Explanation of bash script checking permissions

For all the text lines returned from "cat /etc/shells", process a loop while setting each line from the text file /etc/shells as a variable of "f". The first if statement checks to see if the file exists. The second if statement checks if the file in "f" is a link and if so,&nbsp;reassign&nbsp;the variable "f" to&nbsp;the returned value from running "readlink -f $f" then process the file with stat to get the octal value of permissions. If the file is not a link, try to process the file with stat to get the octal value. The next if statement checks to see the file in $f is less than or equal to 755. If the octal value is less than or equal to 755, a line will be&nbsp;printed indicating the file has passed the test. If the octal value is more than 755, a line will be&nbsp;printed indicating the file has not passed the test.
Here is a sample output from one of my servers:

    --- passed =&gt; 755 - /bin/bash
    --- passed =&gt; 755 - /bin/bash
    --- passed =&gt; 755 - /sbin/nologin
    --- passed =&gt; 755 - /bin/ash
    --- passed =&gt; 755 - /bin/ash
    --- passed =&gt; 755 - /bin/ksh
    --- passed =&gt; 755 - /bin/ksh
    --- passed =&gt; 755 - /bin/ksh
    --- passed =&gt; 755 - /bin/tcsh
    --- passed =&gt; 755 - /bin/tcsh
    --- passed =&gt; 755 - /bin/zsh
