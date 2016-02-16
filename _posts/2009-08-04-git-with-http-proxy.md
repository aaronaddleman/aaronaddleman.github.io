---
layout: post
title: "Git with http proxy"
description: ""
tags: [cli]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


If you are in a situation (like me) where you are behind a http proxy and want to use the git protocol, set your http_proxy to your server and change the url of the git address to http. YAYAY :D
here is an example:

{% highlight bash %}
    export set http_proxy="http://proxyhost.com:proxyport"
    git clone http://github.com/your/git/path.git
{% endhighlight %}
