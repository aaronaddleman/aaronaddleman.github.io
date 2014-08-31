---
layout: post
title: "Installing python modules to your home directory and then using them!"
description: ""
tags: [system, programming]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


To install python modules to your home directory, change to the directory to the uncompressed folder of the module needed to be installed, then run:

{% highlight bash %}
    python setup.py install --home=$HOME
{% endhighlight %}
