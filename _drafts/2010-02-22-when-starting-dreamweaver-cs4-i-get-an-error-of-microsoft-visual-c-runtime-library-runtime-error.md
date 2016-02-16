---
layout: post
title: "When starting Dreamweaver CS4 I get an error of microsoft visual c++ runtime library: runtime error"
description: ""
tags: [uncategorized]
image:
  feature: 9621021454_60be8c21d0_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# When starting Dreamweaver CS4 I get an error of microsoft visual c++ runtime library: runtime error

<p>Today I got an error message of "microsoft visual c++ runtime library: runtime error ..." when attempting to run Adobe Dreamweaver CS4. This is horrible!! Here is a screen show showing what I got:
[caption id="attachment_705" align="aligncenter" width="300" caption="my dreamweaver cs4 windows error"]<a href="/assets/files/dreamweaver-cs4-windows-error.png"><img class="size-medium wp-image-705 " title="dreamweaver cs4 windows error" src="/assets/files/dreamweaver-cs4-windows-error-300x144.png" alt="dreamweaver cs4 windows error" width="300" height="144" href="/assets/files/dreamweaver-cs4-windows-error-300x144.png"></a>[/caption]
My method for fixing this error on Windows XP was to do move the following directory into my Recycle Bin:
</p>
<ul>
<li>c:\Documents and Settings\[username]\Application Data\Adobe\Dreamweaver CS4</li>
</ul>
Note: The "Application Data" folder is hidden and you might need to do the following:
<ol>
<li>Choose menu "Tools"</li>
<li>Choose menu item "Folder Options"</li>
<li>Choose tab "View"</li>
<li>Enable "Show hidden files and folders"</li>
<li>Click "OK"</li>
</ol>
After removing the directory, launching Dreamweaver worked! I was also surprised that I did not loose any of my site settings.
