---
layout: post
title: "Resetting Windows Domain password from OS X"
description: ""
tags: [system]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>I like doing lots of things from my mac. With that I had to look up how to do this, so my blog entry here is for my own person archival purposes:
</p>
<pre><code>smbpasswd -U username -r DOMAIN_CONTROLLER_IP</code></pre>
