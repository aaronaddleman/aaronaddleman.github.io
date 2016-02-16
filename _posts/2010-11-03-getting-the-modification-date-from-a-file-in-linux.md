---
layout: post
title: "Getting the modification date from a file in linux"
description: ""
tags: [cli]
image:
  feature: 8160227607_ba0919e74a_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


{% highlight bash %}
    stat --format=%Y filename.txt
{% endhighlight %}
