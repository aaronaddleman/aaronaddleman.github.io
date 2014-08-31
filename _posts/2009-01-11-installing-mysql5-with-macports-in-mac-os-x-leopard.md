---
layout: post
title: "Installing mysql5 with macports in mac os x leopard"
description: ""
tags: [system]
image:
  feature: 9621021454_60be8c21d0_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


## Install mysql and server with macports:

{% highlight bash %}
    port install mysql5 +server
{% endhighlight %}

## Generate the default database and permissions tables. 

This is a good command to know if you want to wipe all your settings and start from scratch.

{% highlight bash %}
    /opt/local/lib/mysql5/bin/mysql_install_db --user=mysql
{% endhighlight %}

## Launch mysql daemon

{% highlight bash %}
    /opt/local/bin/mysqld_safe5
{% endhighlight %}

## Security 

Set your admin password for security</strong>

{% highlight bash %}
    mysqladmin5 -u root password (your password)
{% endhighlight %}


## Make links to make your life easy

{% highlight bash %}
    ln -s /opt/local/lib/mysql5/bin/mysql /opt/local/bin/mysql
    ln -s /opt/local/lib/mysql5/bin/mysqladmin /opt/local/bin/mysqladmin
    ln -s /opt/local/lib/mysql5/bin/mysqldump /opt/local/bin/mysqldump
{% endhighlight %}
