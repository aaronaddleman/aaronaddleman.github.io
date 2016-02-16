---
layout: post
title: "ipfw logging in Leopard"
description: ""
tags: [system]
image:
  feature: 8160262732_04666c38b1_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I know this has already been explained in other posts and I really don't care. This entry is for me and my sometimes-failing-memory to serve as a reminder when I have to reinstall OSX again in the future.
To start logging IPFW entries, here is an example:

{% highlight bash %}
    sudo sysctl -w net.inet.ip.fw.verbose=1
    sudo ipfw add 1 allow log ip from any to any
{% endhighlight %}

edit the file /etc/syslog.conf to log to the file of your preference

{% highlight bash %}
    !-ipfw (at top of file to exclude it from any file)
    !ipfw *.* /var/log/ipfw.log (at bottom of file to log to ipfw.log file)
{% endhighlight %}