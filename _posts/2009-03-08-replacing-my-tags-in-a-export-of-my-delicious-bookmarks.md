---
layout: post
title: "Replacing my tags in a export of my delicious bookmarks"
description: ""
tags: [programming]
image:
  feature: 9553056715_0a418a1852_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>After exporting my bookmarks into an html format, I used this command to replace tags with a new name:
<span style="font-family: terminal;">cat export.html | sed -e '/tags/s/tags:\ *[a-z]*/tags: MATCH/g'</span></p>
