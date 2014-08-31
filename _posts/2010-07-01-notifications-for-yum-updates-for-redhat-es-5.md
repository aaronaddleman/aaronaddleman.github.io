---
layout: post
title: "Notifications for yum updates for RedHat ES 5"
description: ""
tags: [system]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


When keeping your server up to date, having an email being sent to you with notification of updates needing to be applied, the yum-updatesd.conf file is the answer. Here is a sample of what I put into the file:

{% highlight bash %}
    [main]
    # how often to check for new updates (in seconds)
    run_interval = 3600
    # how often to allow checking on request (in seconds)
    updaterefresh = 600
    # how to send notifications (valid: dbus, email, syslog)
    emit_via = dbus,email
    # email to
    email_to = myemailaddress@domain.com
    # email_from
    email_from = admin@domain.com
    # server
    smtp_server = server.domain.com
    # should we listen via dbus to give out update information/check for
    # new updates
    dbus_listener = yes
    # automatically install updates
    do_update = no
    # automatically download updates
    do_download = yes
    # automatically download deps of updates
    do_download_deps = yes
{% endhighlight %}
