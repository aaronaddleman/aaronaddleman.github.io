---
layout: post
title: "How to install ruby gems behind a proxy server"
description: ""
tags: [cli, ruby, programming]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>I am not going to say too much about how to do this, but just provide an example of what you need to type in:
/opt/local/bin/gem install GEMNAME --http-proxy="http://proxy.server.com:80" -V</p>
