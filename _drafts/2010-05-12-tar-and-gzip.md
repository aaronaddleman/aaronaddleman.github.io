---
layout: post
title: "Tar and Gzip"
description: ""
tags: [uncategorized]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Tar
<span style="font-family: terminal, monaco;">tar cvf backup.tar /etc</span>
</p>
<h3>Gzip</h3>
gzip -9 backup.tar
tar cvf - /etc  gzip -9c &gt; backup.tar.gz
<h3>To untar</h3>
tar xvf backup.tar
<h3>To ungzip</h3>
gunzip backup.tar.gz
<h3>To Untar and Ungzip</h3>
gunzip -c backup.tar.gz &nbsp;|&nbsp;tar xvf -
<h3>To list contents of a tar.gz file</h3>
tar -ztvf file.tar.gz
<h3>To list contents of a zip file</h3>
unzip -l [filename].zip
