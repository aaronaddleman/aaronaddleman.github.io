---
layout: post
title: "node.js hello world example with simple bootstrap"
description: ""
tags: [programming]
image:
  feature: IMG_0566.JPG
  credit: Aaron Addleman
comments: true
share: true
---


My first step into learning about Node.js and I here is my hello world example:

{% highlight html %}
    var http = require('http')
    http.createServer(function(request, response) {
    console.log('new request');
    response.writeHead(200, {
    'Content-Type': 'text/plain'
    });
    response.end('Hello World!');
    }).listen(4000);
{% endhighlight %}
