---
layout: post
title: "Setting your proxy server variable in Emacs"
description: ""
tags: [emacs]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>To set your proxy server in Emacs, type the following in a empty buffer:
<code>(setenv "http_proxy" "http://your.proxy.server.com:8080")</code>
Then execute the lisp code in the current buffer with:
<code>M-x eval-current-buffer</code></p>
