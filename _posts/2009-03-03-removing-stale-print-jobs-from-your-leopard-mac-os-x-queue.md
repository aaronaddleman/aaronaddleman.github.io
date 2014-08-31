---
layout: post
title: "Removing stale print jobs from your leopard mac os x print queue"
description: ""
tags: [system]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>After four months of staring at some stale jobs in my print queue, I decided to venture off in the direction to solve this problem as it has been bothering me for quite some time.
This solution will not destroy any information but will require a restart since that is the only way I safely know how to make this solution work, for now. I would think there is some way to restart the printer processes, but I did not go that far. Perhaps some day I will on the next time this problem occurs.
<span style="text-decoration: underline;"><strong>WARNING</strong></span>: the following is for the people of non terminal fear. Proceed at your own choice.
First I will explain what needs to be done. All of the print jobs exist in /private/var/spool/cups. We can search for our stale jobs by picking out a "word" that is part of the job title. After finding the files exist (this is step 2) which contain the "word" of our stale jobs we setup a directory on our desktop (step 3) and move them into the new directory in step 4.
After all that, here is the short version and list of commands with examples:
</p>
<ol>
<li><span style="font-family: terminal,monaco;">cd /private/var/spool/cups</span></li>
<li><span style="font-family: terminal,monaco;">grep "report" *</span></li>
<li><span style="font-family: terminal,monaco;">mkdir $HOME/Desktop/stale_jobs</span></li>
<li><span style="font-family: terminal,monaco;">mv `grep "word" * | awk '{print $3}' | xargs` $HOME/Desktop/stale_jobs</span></li>
</ol>
Good luck! Please post repsonses with your suggestions.
