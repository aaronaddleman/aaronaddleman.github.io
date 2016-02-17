---
layout: post
title: "Apache compression"
description: "Howto enable compression in Apache with an exeception for the IE browser."
tags: [sysadmin]
image:
  feature: IMG_5081.jpg
  credit: Aaron Addleman
  creditlink: 
comments: true
share: true
---

Small example of how to enable compression in Apache while excluding the IE browser for those times when Microsoft decides to do things differently.

{% highlight apache %}
<LocationMatch "^/.*">
  <IfModule mod_deflate.c>
    # place filter 'DEFLATE' on all outgoing content
    SetOutputFilter DEFLATE
    # add additional filters by file mimetype
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE image/svg+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/atom_xml
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE application/x-httpd-php
    AddOutputFilterByType DEFLATE application/x-httpd-fastphp
    AddOutputFilterByType DEFLATE application/x-httpd-eruby
    AddOutputFilterByType DEFLATE text/html
    # only for ie
    BrowserMatch \bMSIE no-gzip gzip-only-text/html
    # exclude uncompressible content via file type
    SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png|rar|zip)$ no-gzip dont-vary
    #<IfModule mod_headers.c>
      # properly handle requests coming from behind proxies
      #Header append Vary User-Agent
   #</IfModule>
  </IfModule>
</LocationMatch>
{% endhighlight %}