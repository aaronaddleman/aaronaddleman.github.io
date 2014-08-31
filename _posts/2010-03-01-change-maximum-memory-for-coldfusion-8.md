---
layout: post
title: "Change maximum memory for coldfusion 8"
description: ""
tags: [system]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>First, it might be good for you to get the total amount of free memory on your system (using -m will present the information in MB):
</p>
<pre><span style="font-size: x-small;">[root@www1 bin]# free -m
total &nbsp; &nbsp; &nbsp; used &nbsp; &nbsp; &nbsp; free &nbsp; &nbsp; shared &nbsp; &nbsp;buffers &nbsp; &nbsp; cached
Mem: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1770 &nbsp; &nbsp; &nbsp; 1754 &nbsp; &nbsp; &nbsp; &nbsp; 15 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; 74 &nbsp; &nbsp; &nbsp; &nbsp;894
-/+ buffers/cache: &nbsp; &nbsp; &nbsp; &nbsp;785 &nbsp; &nbsp; &nbsp; &nbsp;984
Swap: &nbsp; &nbsp; &nbsp; &nbsp; 1983 &nbsp; &nbsp; &nbsp; &nbsp; 74 &nbsp; &nbsp; &nbsp; 1909</span><span style="font-size: x-small;">
</span></pre>
<pre><span style="font-size: x-small;">Lo</span>oks like I have about 1754 MB free.</pre>
Edit the following file:
<span style="font-family: terminal, monaco;">/opt/jrun4/bin/jvm.config</span>
then change the following line from:
<span style="font-family: terminal, monaco;">-XX:MaxPermSize=512m</span>
to something higher, like:
<span style="font-family: terminal, monaco;">-XX:MaxPermSize=768m</span>
