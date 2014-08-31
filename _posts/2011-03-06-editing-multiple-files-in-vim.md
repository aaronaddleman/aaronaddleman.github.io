---
layout: post
title: "Editing multiple files in Vim"
description: ""
tags: [vi]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>While editing multiple files in Vim, I have found the following commands to be&nbsp;helpful:
</p>
<ol>
<li>e[dit] protocol://username@server.com/path
<ol>
<li>Edit a file remotely by using FTP,SSH,WebDAV</li>
<li>Password can be stored in your $HOME/.netrc file</li>
</ol>
</li>
<li>w[rite] protocol://username@server
<ol>
<li>Write a file remotely by using SCP</li>
</ol>
</li>
<li>vsplit protocol://username@server.com/path
<ol>
<li>Split the window vertically with the new file</li>
</ol>
</li>
<li>mksession filename
<ol>
<li>Store the current session (open files, tabs) into "filename" to be&nbsp;retrieved&nbsp;later by :source</li>
</ol>
</li>
<li>source filename
<ol>
<li>load the session from filename</li>
</ol>
</li>
<li>newtab
<ol>
<li>create a new tab</li>
</ol>
</li>
<li>gt
<ol>
<li>move to the next tab</li>
</ol>
</li>
<li>CTRL + W [h|j|k|l]
<ol>
<li>move to another window</li>
</ol>
</li>
</ol>
