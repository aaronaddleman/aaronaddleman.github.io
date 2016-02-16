---
layout: post
title: "MySQL use DATABASENAME hung with no response"
description: "When you are faced with a hanging process of MySQLd and no response; I found a command for repairing the tables."
tags: [databases]
image:
  feature: IMG_0612.JPG
  credit: Aaron Addleman
comments: true
share: true
---


When I logged into my MySQL server with the root account and type in use DATABASENAME; the server hung and did not display any new information. I looking into the problem and decided to repair the databases files with a command called `myisamchk`. To use this command, I shutdown the database service, went to the database path of "`/var/lib/mysql/DATABASENAME`" and ran the following to loop through all files ending with "MYI":

{% highlight sql %}
for a in `ls *MYI`; do myisamchk -r -q $a; done
{% endhighlight %}

After it was done displaying some information about repairing some records I relaunched my database service and all was okay.
