---
layout: post
title: "Reinstalling Netbackup 6.0 and recovering the catalog"
description: ""
tags: [system]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Netbackup Server is a crazy application and can be annoying if you do not know all of the files and commands needed to restore stuff. Only after you pour over the manuals that are not complete and talking to technical support, do you get the full idea of what your plan looks like to restore a working install of Netbackup 6.0. What follows is the result of weeks of frustration with trial and error until I got it all back up to working again.
</p>
<ol>
<li>Make sure your hostname is set correctly</li>
<li>Install the ICS packages</li>
<li>Install Netbackup 6.0 with MP4</li>
<li>Recover the catalog
<ol>
<li>/usr/openv/netbackup/admincmd/bprecover -r ALL -dpath /path/to/catalog</li>
</ol>
</li>
<li>Update netbackup to MP7</li>
<li>Restart all the services</li>
<li>This should get you back to where you need to be</li>
</ol>
