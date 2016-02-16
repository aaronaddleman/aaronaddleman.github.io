---
layout: post
title: "Awk if statement for testing permissions of files and directories"
description: ""
tags: [cli]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>By using stat and awk, you can gather some information for passing or failing a permissions check. Below is a bash script snippet I used for checking all the home directories in /etc/passwd to make sure they are&nbsp;at permissions level of 755 or less. I am sure there is a better way of doing this and this might not work for people who have the sticky bit set, but for now it gets the job done:
</p>
<pre>stat -c "%a %n" `awk -F":" '{print $6}' /etc/passwd` | awk '{
if ($1 &lt;= 755 )
print "--- pass","=&gt;",$0;
else
print "+++ Fail","=&gt;",$0;
}'</pre>
<pre></pre>
