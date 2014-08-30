---
layout: post
title: "Zimbra error message Unable to determain services from ldap"
description: "How to resolve the error message Unable to determain services from ldap"
tags: [sysadmin]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

At some point, you might get this error message with Zimbra (I hope you don't experience this problem) and the problem is that the certificate is not valid. The short solution for me was to check if Zimbra can use untrusted certs, and if that returns false, I can set the value to true and restart Zimbra. The longer fix would be to make a valid cert. Here are the commands to do the short fix:

{% highlight bash %}
    $ zmlocalconfig -s ssl_allow_untrusted_certs <-- checks status
    $ zmlocalconfig -e ssl_allow_untrusted_certs=true; zmcontrol restart
{% endhighlight %}
