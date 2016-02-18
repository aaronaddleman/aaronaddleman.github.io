---
layout: post
title: "resetting the password for coldfusion 8 because i forgot"
description: ""
tags: [programming, system]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Time has passed since I have last used the Coldfusion Admin panel to do anything and I recently was building a new server and forgot the password to the admin panel. So to reset it do the following:
</p>
<ol>
<li>shutdown the server (<em>very important!!!</em> <em>hehe</em>)</li>
<li>look for the file neo-security.xml
<ol>
<li>multiserver config - j2ee
<ol>
<li>servers/cfusion/cfusion-ear/cfusion-war/WEB-INF/cfusion (instance name)/lib/neo-security.xml</li>
</ol>
</li>
<li>single server config
<ol>
<li>/lib/neo-security.xml</li>
</ol>
</li>
</ol>
</li>
<li>search for the string "admin.security.enabled"</li>
<li>set its boolean value to "false"</li>
<li>save the file</li>
<li>access the "cfide" admin interface with no login needed</li>
<li>goto the security settings and change the password</li>
<li>stop the server</li>
<li>change the previous boolean value from false back to true</li>
<li>start your server</li>
</ol>
