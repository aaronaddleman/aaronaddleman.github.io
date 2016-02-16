---
layout: post
title: "root password for hmailserver mysql database"
description: ""
tags: [system]
image:
  feature: DSC03476.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>To connect to the hMailServer database with the root account use the following steps:
</p>
<ol>
<li>run the script "hMailServer\Addons\Utilities\DecryptBlowfish.vbs"</li>
<li>when you see the dialog box, enter in the password found in hMailServer.ini</li>
<li>you should see the password displayed</li>
</ol>
tip: Make sure you use the correct port because by default, hMailServer uses 3307.
