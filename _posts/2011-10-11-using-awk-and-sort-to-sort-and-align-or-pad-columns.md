---
layout: post
title: "Using awk and sort to sort and align or pad columns"
description: ""
tags: [uncategorized]
image:
  feature: 9621021454_60be8c21d0_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Some of my most popular tools are awk and sort (and the usual sed and uniq). But sometimes I would like to have a nice print out from awk in aligned format and sort one of the columns after the padding. Today I found out a nice combination and it shows how to do just what I explained in this nice example of printing out the username and home directory from the /etc/passwd file:
</p>
<pre>cat /etc/passwd | awk -F\: '{printf "%-20s%-20s\n", $1, $6}' | sort -k</pre>
