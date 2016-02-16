---
layout: post
title: "Webtrends 8.0 software and Campaigns"
description: ""
tags: [uncategorized]
image:
  feature: 11786474283_9f0f30e96c_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<div class="posterous_autopost">
These are my notes for using campaigns with WebTrends 8.0a.
<span style="font-size: large;">Overview</span>
<span style="font-size: small;">When sending out emails,&nbsp;announcements&nbsp;about your content and you want to track the success and use of a link, your best bet is to use campaigns.</span>
<span style="font-size: large;">Stuff to Know</span>
<span style="font-size: large;"><span style="font-size: small;">Some stuff to know when tracking links:</span></span>
<ol>
<li>the campaign name should be safe to use within a browser (eg. replace spaces with %20)</li>
<li>
<a href="http://yourdomain.com/page">http://yourdomain.com/page</a>&amp;wt.mc_id=[alpha-numeric or campaign name]</li>
<li>If you want to edit the campaigns manuall: C:\Program Files\WebTrends\storage\config\wtm_wtx\datfiles\datasources</li>
</ol>
The campaigns file always should have:
<ol>
<li>hard character returns (msdos)</li>
<li>1 blank line at the end</li>
<li>always the same number of columns for every line</li>
</ol>
<span style="font-size: large;">List of columns in the campaigns file</span>
<ol>
<li>CampaignID, <span> </span>identifcation number</li>
<li>Description, <span> </span>what the entry is for</li>
<li>Creative,<span> </span>name of method</li>
<li>Creative Type,<span> </span>print/email/banner<span> </span>
</li>
<li>Demand Channel,<span> </span>
</li>
<li>Marketing Activity,</li>
<li>Marketing Program,</li>
<li>Offer,</li>
<li>Partner,</li>
<li>Placement</li>
</ol>
<p style="font-size: 10px;"><a href="http://posterous.com">Posted via web</a> from <a href="http://myprimedirective.posterous.com/webtrends-80-software-and-campaigns">myprimedirective's posterous</a></p>
</div>
