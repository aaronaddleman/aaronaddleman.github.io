---
layout: post
title: "Disable console access from root account"
description: ""
tags: [system]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Edit the /etc/gdm/custom.conf file and set the following line from:
<code>AllowRoot=true</code>
to
<code>AllowRoot=false</code>
IF you need to restore access to the root account because you locked yourself out, check out the article on <a href="http://9thphort.net/how-to-start-RedHat-ES-5-in-single-user%E2%80%93mode">how to start RedHat ES 5 in single user mode</a>.</p>
