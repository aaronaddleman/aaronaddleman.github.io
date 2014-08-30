---
layout: post
title: "Puppet certificate problem and resolution"
description: ""
tags: [puppet]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


    Error: Could not request certificate: The certificate retrieved from the master does not match the agent's private key.
    Certificate fingerprint: 6B:33:9B:D6:F1:34:7A:9D:E8:F9:53:7C:E3:1D:3E:5F:89:64:BD:EC:12:F7:ED:E3:35:C2:58:83:51:15:01:74

To fix this, remove the certificate from both the master and the agent and then start a puppet run, which will automatically regenerate a certficate.

On the master:

{% highlight bash %}
    puppet cert clean pagent
{% endhighlight %}

On the agent:

{% highlight bash %}
    rm -f /etc/puppetlabs/puppet/ssl/certs/pagent.pem
    puppet agent -t
{% endhighlight %}
