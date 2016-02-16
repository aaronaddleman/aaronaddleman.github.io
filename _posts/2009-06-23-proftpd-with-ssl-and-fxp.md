---
layout: post
title: "proftpd with ssl and fxp"
description: ""
tags: [system]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


After you have installed your awesome Linux distribution, you might be looking to use a protocol for allowing users be able to update content on the box. I have chosen to use ProFTPD because of its features of setting user and group permissions based on directory patterns in its config file. Unfortunately, the user and password information are broadcasted in the clear across the data packets. Never Fear!! SSL is here!

## Generate the ssl certificate

{% highlight bash %}
    mkdir /etc/proftpd/ssl
    openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
{% endhighlight %}

## Enable the cert

enable TLS by adding the following lines in proftpd.conf and then restart:

{% highlight apache %}
    <IfModule mod_tls.c>
      TLSEngine                  on
      TLSLog                     /var/log/proftpd/tls.log
      TLSProtocol                SSLv23
      TLSOptions                 NoCertRequest
      TLSRSACertificateFile      /etc/proftpd/ssl/proftpd.cert.pem
      TLSRSACertificateKeyFile   /etc/proftpd/ssl/proftpd.key.pem
      TLSVerifyClient            off
      TLSRequired                off
    </IfModule>
{% endhighlight %}