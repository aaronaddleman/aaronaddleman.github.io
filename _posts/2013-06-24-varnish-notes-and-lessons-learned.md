---
layout: post
title: "Varnish notes and lessons"
description: "My notes and lessons I have gained while working with Varnish."
tags: [sysadmin]
image:
  feature: 8160237453_62c4c8c48e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

While spending time with Varnish I started a note pad with my notes and lessons of how to work with Varnish. I should say I am still new to Varnish and my notes are by no means a best solution for the problems they address, but I found myself refering back multiple times.

##  Diagnostics

To get some information on what is going on in Varnish, I have used the following methods for help in these matters:

### View the headers

It's nice to view the headers of the page or resource to determain some fields that may have been set from Varnish to help with troublesooting. Or to show which cookies you might need to remove.

{% highlight bash %}
# install the GET program to help with diagnostics
yum install perl-libwww-perl
# install firefox addon to help view http headers
https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/
{% endhighlight %}

### ULRs hitting the backend and not getting cached

If you need to view the requests that are not getting cached, this command helps. There are two ways to view this list, one that is constantly updating, and the other that prints out the top entries and then exits.

{% highlight bash %}
# looking for urls that are hitting the backend
varnishtop -i txurl
# looking for urls that are hitting the backend, print out and exit
varnishtop -1 -i txurl
# after finding the heavy hitter, examine the log entries of the url /foo/bar
varnishlog -c -m 'RxURL:^/foo/bar
{% endhighlight %}


### Test varnish configuration script for errors

Sometimes making changes to the VCL configuration can results in error. Find out where the error is with this command:  /usr/sbin/varnishd -C -f default.vcl

## VCL configuration notes

## Cache management

### Example of adding a ban using `telnet localhost 6082`

{% highlight text %}
ban.url req.http.host ~ "www.website.com" && req.url ~ "/directory/of/path/"
{% endhighlight %}
