---
layout: post
title: "Augeas parsing errors"
description: "Augeas C libray is included with puppet to help manipulate configuration files with lenses. Sometimes there are problems when parsing the files. Find out how to see those errors and correct them.
"
tags: [puppet]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Today I have been working with Augeas tool to parse some configuration files and I got the following error from a installed module:

    Error: /Stage[main]/Syslogging/Syslog[authinfo]: Could not evaluate: Augeas didn't load /etc/rsyslog.conf with Rsyslog.lns from : Get did not match entire input

This was for parsing the /etc/rsyslog.conf file (pretty obvious, but hey, does not hurt to call it out).

So I started to dig around and at the top of my list of questions was one: Where is the lens installed? I quickly found out that the lenses are in the following location:

{% highlight bash %}
    /opt/puppet/share/augeas/lenses
{% endhighlight %}

But this did not help me after I verified the lens was there. So I started to dig around some more with the `/opt/puppet/bin/augtool` utility and that is where I started to make some progress on this error message:

{% highlight bash %}
    augtool> ls /augeas/files/etc/rsyslog.conf/error/
    pos = 2943
    line = 83
    char = 0
    lens = /opt/puppet/share/augeas/lenses/dist/rsyslog.aug:30.10-.57:
    message = Get did not match entire input
    augtool> 
{% endhighlight %}

As a challenge to myself, I wanted to see how I could use the `pos` number to find the offending block of information. So I found out one method of using the `dd` program and setting the block size to 1 byte. Here is my full command below:

{% highlight bash %}
    cat /etc/rsyslog.conf | dd bs=1 skip=2943
{% endhighlight %}

This gave me the following output:

    $template SpiceTmpl,"%TIMESTAMP%.%TIMESTAMP:::date-subseconds% %syslogtag% %syslogseverity-text%:%msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"
    
    :programname, startswith, "spice-vdagent"   /var/log/spice-vdagent.log;SpiceTmpl
    224+0 records in
    224+0 records out
    224 bytes (224 B) copied, 0.000891242 s, 251 kB/s


For extra exploration, you can list all of the errors that augeus has by using the command:

    augtool> match /augeas//error
    /augeas/files/etc/ld.so.conf.d/kernel-2.6.32-358.el6.x86_64.conf/error = parse_failed
    /augeas/files/etc/cups/printers.conf/error = parse_failed
    /augeas/files/etc/rsyslog.conf/error = parse_failed
    augtool> 

