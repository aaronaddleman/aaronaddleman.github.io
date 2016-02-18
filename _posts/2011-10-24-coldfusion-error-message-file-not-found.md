---
layout: post
title: "ColdFusion error message File Not Found"
description: ""
tags: [system]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>If you are staring at a error message produced by ColdFusion that reads "File Not Found" but you know the file is available from you Linux apache service, you would be having a similar day that I had last week. While searching around on the net, I found many many other posts that described this same problem, and their solutions where of no help. Most these articles talked about having the correct installation, disabling caching, or applied to an earlier version of ColdFusion, but I could not find any solution that applied to my situation:
I have many virtual hosts in Apache on a Linux server with two virtual hosts serving CFM files correctly from a ColFusion Multisite installation. But any new virtual hosts would produce the error "File not Found".
This message is very deceiving, but I noticed that in the directory of:
/opt/jrun4/servers/cfusion/cfusion-ear/cfusion-war/
there is a CFM file, then the file is located. Bizarre! Anyways, the solution to this problem was really simple but I was thrown off by the error message. The solution is to make sure the ColdFusion user has executable rights on the directory being provided by Apache. </p>
