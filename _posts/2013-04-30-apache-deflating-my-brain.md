---
layout: post
title: "Apache compression"
description: "Howto enable compression in Apache with an exeception for the IE browser."
tags: [sysadmin]
image:
  feature: abstract-6.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true
---

Small example of how to enable compression in Apache while excluding the IE browser for those times when Microsoft decides to do things differently.

{% uvhighlight lang=apache-config file=/assets/files/apache-deflate-gzip.conf %}
{% enduvhighlight %}