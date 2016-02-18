---
layout: post
title: "Redhat and up2date with RPM package conflict errors"
description: ""
tags: [system]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>If you get this:
</p>
<blockquote>RPM package conflict error.&nbsp; The message was:
Test install failed because of package conflicts:</blockquote>
Then you got to do this:
<ol>
<li><span style="font-family: terminal,monaco;">rpm -e --allmatches [conflicting package]</span></li>
<li><span style="font-family: terminal,monaco;">up2date -p</span></li>
<li><span style="font-family: terminal,monaco;">up2date [conflicting package]</span></li>
<li><span style="font-family: terminal,monaco;">up2date -u</span></li>
</ol>
This has cleared up my problem in the past and makes for a clean solution.
