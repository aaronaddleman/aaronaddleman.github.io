---
layout: post
title: "listing arguments for a process"
description: ""
tags: [sysadmin]
image:
  feature: IMG_0601.JPG
  credit: Aaron Addleman
comments: true
share: true
---


{% highlight bash %}
strings < /proc/`pgrep java`/environ
{% endhighlight %}