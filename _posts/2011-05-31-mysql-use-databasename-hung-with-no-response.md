---
layout: post
title: "MySQL use DATABASENAME hung with no response"
description: ""
tags: [database]
image:
  feature: IMG_0612.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>When I logged into my MySQL server with the root account and type in use DATABASENAME; the server hung and did not display any new information. I looking into the problem and decided to repair the databases files with a command called "<code>myisamchk</code>". To use this command, I shutdown the database service, went to the database path of "<code>/var/lib/mysql/DATABASENAME</code>" and ran the following to loop through all files ending with "MYI":
<br><code>
for a in `ls *MYI`; do myisamchk -r -q $a; done
</code>
<br>
After it was done displaying some information about repairing some records I relaunched my database service and all was okay.</p>
