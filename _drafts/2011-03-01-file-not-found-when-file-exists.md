---
layout: post
title: "'File not found' when file exists"
description: ""
tags: [programming]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>I ran into this error recently:
<code>"File Not Found"</code>
But the file was there! I was very perplexed. At first, I tried to make sure my permissions were correct or that the Apache rules were okay. In the end, I found out that the filesystem on my server had been launched as read-only for the ColdFusion install partition (in my case, this was /opt). After killing off all processes and files used on /opt by using <code>lsof</code> to list open files and remounting /opt I was back up and running.
Hope this helps anyone else!</p>
