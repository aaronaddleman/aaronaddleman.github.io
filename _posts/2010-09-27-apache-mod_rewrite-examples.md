---
layout: post
title: "Apache mod_rewrite examples"
description: ""
tags: [sysadmin]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


# General

The mod_rewrite is a very powerful module for manipulating the server side path ways and conversions with Apache. To further my studies on this feature, I have dedicated this page to everything about it.

## Example 1: Rewriting with some matches
My first example is composed of a very basic transformation from one value to another.

{% highlight plain %}
    RewriteEngine On
    RewriteBase /thebase
    RewriteRule ^matchone/(.*) /MatchOne/$1 [R=301,L]
    RewriteRule ^matchtwo/(.*) /MatchTwo/$1 [R=301,L]
    RewriteRule ^Match/(.*) /match/$1 [R=301,L]
    # send anyone going target_a, redirect to to target_b
    RewriteRule ^target_a/(.*)/?$ http://site.domain.com/default/index.php/$1 [L]
{% endhighlight %}

## Example 2: Rewriting with some matches except for visits from a specific IP Address
 

## Example 3: Rewriting with query parameters

Sometimes we have a query parameter in the url and need to have it targeted. The following conditions check first for a specific url and then a query parameter, then rewrite the url to a new value:

{% highlight plain %}
    RewriteCond %{REQUEST_URI} ^/about/index.html$
    RewriteCond %{QUERY_STRING} ^queryparamname=a_value$
    RewriteRule ^/about/index.html$ /newabout/section [R,L]
{% endhighlight %}

## Example 4: Using RewriteMap

{% highlight plain %}
    # define the map
    RewriteMap urlmap txt:/etc/httpd/mod_rewrites/map.txt

    # turn on rewrite engine
    RewriteEngine on

    # require a match in the map to continue
    RewriteCond ${urlmap:$1} ^/.+

    # rewrite the entire request and return the value from the map file
    RewriteRule ^/(.+)$ ${urlmap:$1} [R,L]
{% endhighlight %}
