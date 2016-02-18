---
layout: post
title: "Using rewritemap with Apache"
description: ""
tags: [sysadmin]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Using the text format

After using the rewritemap a couple of times for certain projects I needed to make some notes about its use. Here is a config that I have been using recently that has been doing the job pretty good:

### apache config

{% highlight plain %}
### define the map
RewriteMap urlmap txt:/etc/apache2/map.txt

### turn on rewrite engine
RewriteEngine on
RewriteLog "/var/log/apache2/domain.rewrite.log"
RewriteLogLevel 5

### redirect domain.com to www.domain.com
RewriteCond %{HTTP_HOST} ^domain.com
RewriteRule ^/(.*)$ http://www.domain.com/$1 [R=permanent,L]

### Ignore Matching Directories
RewriteRule ^/(files|js|file.php|themes) - [L,NC]

### require a match in the map to continue
RewriteCond ${urlmap:/$1} ^.+

# Choose one of the following rewrite rules:

### rewrite the entire request and return the value from the map file
RewriteRule ^/(.+)$ ${urlmap:/$1} [R,L]
### rewrite the entire request to a new domain
RewriteRule ^/(.+)$ http://www.newdomain.com/${urlmap:/$1} [R,L]
{% endhighlight %}

### map file /etc/apache2/map.txt

The map file is a key and value based text file that is split up by a single space. Below is a sample of the files I have used:

{% highlight bash %}
/sitemap.xml /sitemap
/path/one /better/path/
{% endhighlight %}

## Using the DBM format

Using the DBM format has said to be faster if your text file is too large. To switch from your text method to the DBM method, you need to convert the text file into a database that Apache can read.

### How to convert the text file

{% highlight bash %}
httxt2dbm -i /etc/apache2/map.txt -o /etc/apache2/map_db
{% endhighlight %}

This command takes the input of the map.txt and outputs two files called:

{% highlight bash %}
/etc/apache2/map_db.dir
/etc/apache2/map_db.pag
{% endhighlight %}

I have used this database by having the following code in my Apache configuration file:

{% highlight plain %}
RewriteMap urlmap dbm:/etc/httpd/mod_rewrites/map_redirct.map
{% endhighlight %}

Notice that the difference is `dbm:` instead of `txt:` which allows Apache to use the dbm format. There are other formats but I have not tried them all yet:


    -f    DBM Format.  If not specified, will use the APR Default.
          GDBM for GDBM files (unavailable)
          SDBM for SDBM files (available)
          DB   for berkeley DB files (available)
          NDBM for NDBM files (unavailable)
          default for the default DBM type
