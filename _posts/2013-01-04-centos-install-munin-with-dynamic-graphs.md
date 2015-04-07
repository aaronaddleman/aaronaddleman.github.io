---
layout: post
title: "Howto install munin version 2.0.8 with dynamic graphs on Centos 6"
description: "This took longer than it should have to get setup. For some reason, I could not find any references on how to get the dynamic zooming of munin to work. The documentation was not very helpful from the example provide (because it did not work) nor in ascertaining how to solve the problem. Anyways, here is my journey and configuration that will help me out the the future."
tags: [sysadmin]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

*Update 10 April, 2013:* Munin version 2.0.10 now includes better support for dynamic zooming out of the box.

This took longer than it should have to get setup. For some reason, I could not find any references on how to get the dynamic zooming of munin to work. The documentation was not very helpful from the example provide (because it did not work) nor in ascertaining how to solve the problem. Anyways, here is my journey and configuration that will help me out the the future.

## Installation

### Yum installing

Because this was a vmware server on my laptop for testing munin, I went with both the node and the server installation.

{% highlight bash %}
yum install munin munin-node
{% endhighlight %}

This provide you with some files, directories, and programs to get munin up and running. 

### Directory permissions

First thing you have to do is check to make sure the temp directories are allowed for writing:

{% highlight bash %}
mkdir /var/lib/munin/cgi-tmp
mkdir /var/lib/munin/cgi-tmp/munin-cgi-graph
chmod 777 /var/lib/munin/cgi-tmp
chmod 775 /var/lib/munin/cgi-tmp/munin-cgi-graph
{% endhighlight %}

## Configuration

### Munin.conf

Next ensure you have the following in your /etc/munin/munin.conf file:

{% highlight bash %}
dbdir /var/lib/munin
htmldir /var/www/html/munin
logdir /var/log/munin
rundir  /var/run/munin

# Where to look for the HTML templates
#
tmpldir /etc/munin/templates

# Where to look for the static www files
#
staticdir /etc/munin/static

# temporary cgi files are here. note that it has to be writable by 
# the cgi user (usually nobody or httpd).
#
cgitmpdir /var/lib/munin/cgi-tmp

# (Exactly one) directory to include all files from.
includedir /etc/munin/conf.d

graph_strategy cgi
html_strategy cgi
{% endhighlight %}

### Apache VirtualHost

Now comes the part where most of my time was wasted away by testing, debugging, then testing again. The Apache VirtualHost configuration for allowing dynamic zoom to work:

{% highlight apache %}
<VirtualHost *:80>
  ServerAdmin webmaster@dev.example.com
  DocumentRoot /var/www/html/munin
  ServerName munin.example.com
  ErrorLog logs/munin-error.log
  CustomLog logs/munin-access_log common
  RewriteLog logs/munin-rewrite.log
  RewriteLogLevel 5
  ServerSignature Off

  # Rewrites
  RewriteEngine On

  # Static content in /static
  RewriteRule ^/favicon.ico /etc/munin/static/favicon.ico [L]
  RewriteRule ^/static/(.*) /etc/munin/static/$1          [L]
  # If it has the word static in the path, send to the static dir
  RewriteRule ^/.*/static/(.*) /etc/munin/static/$1          [L]

  # HTML
  RewriteCond %{REQUEST_URI} .html$ [or]
  RewriteCond %{REQUEST_URI} =/
  RewriteRule ^/(.*)          /var/www/cgi-bin/munin-cgi-html/$1 [L]

  # Images
  RewriteRule ^/(.*) /var/www/cgi-bin/munin-cgi-graph/$1 [L]

  # Ensure we can run (fast)cgi scripts
  <Directory "/var/www/cgi-bin">
    Options +ExecCGI
    <IfModule mod_fcgid.c>
        SetHandler fcgid-script
    </IfModule>
    <IfModule !mod_fcgid.c>
        SetHandler cgi-script
    </IfModule>
  </Directory>
</VirtualHost>
{% endhighlight %}