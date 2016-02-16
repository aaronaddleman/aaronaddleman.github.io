---
layout: post
title: "WebTrends UI logging to monitor user activity"
description: ""
tags: [uncategorized]
image:
  feature: DSC03476.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>WebTrends Analytics 8.x is a Windows based log analyzer to produce graphs and reports of your website traffic. As your users are generating reports, it is helpful to find out what they are doing. Here is how you can accomplish this task:
</p>
<ol>
<li>Goto 'System Managment -&gt; Role Settings'</li>
<li>Click on UI Server</li>
<li>Enable 'Use local settings'</li>
<li>Place a checkbox in 'Enable Tomcat logging'</li>
<li>The log files are located in: 'c:\Program Files\WebTrends\common\jakarta-tomcat\logs\tomcat*.log</li>
</ol>
To modify the tomcat logging settings:
<ul>
<li>c:\Program Files\WebTrends\common\jakarta-tomcat\conf\server.xml</li>
</ul>
