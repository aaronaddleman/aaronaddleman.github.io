---
layout: post
title: "Query system for KB patch information"
description: "Want to know if a patch exists on your Windows system and when it was installed? This command has helped me out many times but is not that easy to remember due to my selfish reasons to use Linux."
tags: [sysadmin]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


To query a windows system for KB patch information the following command line is very helpful:

    wmic qfe get hotfixid | find "KB99999"
    wmic qfe | find "KB99999"
