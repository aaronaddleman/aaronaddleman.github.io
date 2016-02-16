---
layout: post
title: "Changing the host name on redhat linux"
description: ""
tags: [system]
image:
  feature: DSC03309.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>This is for archival purposes from a <a href="http://www.linuxforums.org/forum/redhat-fedora-linux-help/49223-permintally-changing-host-name.html">discussion I found</a>:
Edit the following and change where necessary:
</p>
<pre>/etc/hosts
/etc/sysconfig/network
/etc/sysconfig/network-scripts/ifcfg-eth0 (depends on NIC name)</pre>
then reboot.
