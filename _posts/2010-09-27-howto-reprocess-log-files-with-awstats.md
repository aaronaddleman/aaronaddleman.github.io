---
layout: post
title: "Howto (re)process log files with AWstats"
description: ""
tags: [system, programming]
image:
  feature: IMG_0613.JPG
  credit: Aaron Addleman
comments: true
share: true
---

## Overview

Running AWstats is helpful for finding simple information and I think it does a okay job in identifying robots. Last week I installed xampp onto a Windows server to allow me to process the old log files from my Apache server. These files date all the way back to 2002. It took me a bit of time but I figured out how to:

1. Get AWstats working with xampp
1. Modify the changes needed for getting AWstats working
1. Configure a profile to have AWstats process historical records
1. Monitor its progress

## First step - Install xampp

I am not going to put any details in here because I think this is pretty easy todo. I will say, you should visit your <a href="http://localhost/xampp/security">http://localhost/xampp/security</a> page to ensure your site is secure.

## Installing AWstats

I dropped my AWstats directory into my root install of c:\xampp and copied the files of c:\xampp\awstats\wwwroot\* to the path of c:\xampp\htdocs\awstats
Then created a new file in c:\apache\conf\extra\awstats.conf with the following code:

{% highlight plain %}
    Alias /awstats/classes "c:/xampp/htdocs/awstats/classes"
    Alias /awstats/icon "c:/xampp/htdocs/awstats/icon"
    Alias /awstats/css "c:/xampp/htdocs/awstats/css"
    ScriptAlias /awstats/cgi-bin/ "c:/xampp/htdocs/awstats/cgi-bin/"
    <directory c:>
    Options ExecCGI
    </directory>
{% endhighlight %}

Add the following line in your c:\xampp\apache\httpd.conf:

{% highlight plain %}
    Include extra/awstats.conf
{% endhighlight %}

Save and relaunch Apache to check your changes are correct before continuing.. well, you dont have to, but I recommend it to avoid debugging.

## Building a AWstats profile

I copied an existing file from AWstats directory and made my own with some small changes:

{% highlight bash %}
    Logfile="c:/xampp/perl/bin/perl.exe c:/xampp/awstats/tools/logresolvemerge.pl c:/path/to/log/files/access_log.200201* |"
    Logtype=W
    LogFormat=1
    DirData="c:/xampp/htdocs/awstats/data"
    DirCgi="/awstats/
    DirIcons="/awstats/icon"
{% endhighlight %}

## Processing log files

To begin your processing of the log files:

{% highlight bash %}
    c:\xampp\perl\bin\perl.exe c:\xampp\htdocs\awstats\cgi-bin\awstats.pl -config=name_of_conf -update -debug=3
{% endhighlight %}


I use the -<strong>debug=3 </strong>because it can take a long time to process the log file and I like knowing what is going on.
Good Luck!
