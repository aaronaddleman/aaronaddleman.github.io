---
layout: post
title: "jrun startup bash script for coldfusion 8 to put in init.d "
description: ""
tags: [system]
image:
  feature: IMG_0601.JPG
  credit: Aaron Addleman
comments: true
share: true
---


I got this from <a href="http://www.ipconfig.co.nz/blog/index.cfm/2007/9/17/ColdFusion-8-Instance-Startup-Scripts-Linux-JRun4">Josh Hand's Technology Blog</a> and I have added it to my own blog for archive purposes only!


## The shell script

### Filename
{% highlight bash %}
    vi jrun-myinstance
{% endhighlight %}

### Script

{% highlight bash %}
    #!/bin/bash
    #
    # Startup script for JRun
    # chkconfig: 345 90 14
    # description: JRun myinstance instance service.
    #
    # Source function library.
    . /etc/rc.d/init.d/functions
    #
    case <span style="color: #0000ff;">"$1" in
    start)
    echo -n <span style="color: #0000ff;">"Starting JRun myinstance: "
    /opt/jrun4/bin/jrun -start myinstance
    echo
    ;;
    stop)
    echo -n <span style="color: #0000ff;">"Shuting down JRun myinstance: "
    /opt/jrun4/bin/jrun -stop myinstance
    echo
    ;;
    restart)
    /opt/jrun4/bin/jrun -restart myinstance
    ;;
    *)
    echo <span style="color: #0000ff;">"Usage: $0 {start|stop|restart}"
    exit 1
    esac
    exit 0
{% endhighlight %}

## Installing the script

{% highlight bash %}
    cp jrun-myinstance /etc/init.d/jrun-myinstance"
    chmod 775 /etc/init.d/jrun-myinstance"
    chkconfig --add jrun-myinstance"
{% endhighlight %}

If you want it on the default run level 

{% highlight bash %}
    chkconfig jrun-myinstance on"
{% endhighlight %}

## Start the jrun

{% highlight bash %}
    service jrun-myinstance start
    service jrun-myinstance stop
    service jrun-myinstance restart
{% endhighlight %}
