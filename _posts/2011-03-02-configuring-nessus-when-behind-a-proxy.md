---
layout: post
title: "Configuring Nessus when behind a proxy"
description: ""
tags: [system]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>After installing Nessus, you need to register the plugin feed:
<code>sudo /opt/nessus/bin/nessus-fetch --register XXXX-XXXX-XXXX-XXXX</code>
If you are behind a proxy server, edit the file <code>/opt/nessus/etc/nessus/nessus-fetch.rc</code> and set the following:
<code>
proxy=proxy.domain.org
proxy_port=80</code>
Now you can register the feed with the above command.</p>
