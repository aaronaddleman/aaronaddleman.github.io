---
layout: post
title: "Using BC to help with some simple calculations for a system administrator"
description: ""
tags: [uncategorized]
image:
  feature: DSC03309.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<h1>problem</h1>
Today I had a problem with some email. Tons of email was being sent in to the sendmail process and I had to track its progress to ensure the email was sent out completely. Along the way I noticed that I wanted to do a simple calculation on how many emails were in the /var/spool/mqueue directory and divide that by 2.
<h1>solution</h1>
Since the email I wanted to track was for Jan 18th, I used the grep command to limit my files. Then wrapped this all around a echo statement and appended my operation which got piped to bc in the end. Below is my example:
<code>
echo `ls -al /var/spool/mqueue/ | grep "Jan 18" | wc -l | awk '{print $1}'` "/ 2" | bc</code>
