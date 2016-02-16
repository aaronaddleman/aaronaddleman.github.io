---
layout: post
title: "Netbackup enterprise troubleshooting 'unable to allocate new media for backup, storage unit has none available'"
description: ""
tags: [system]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

I will fully admit that I am not a professional about NetBackup but I have found some nice utilities to use when getting 'unable to allocate new media for backup, storage unit has none available' in my email reports.
If you have not guessed by now, there is no media available. Kind of blantent. Anyways, first you want to see a list of what status your tapes are in with the command:

{% highlight bash %}
    /usr/openv/netbackup/bin/goodies/available_media
{% endhighlight %}

This will print out a list of your media and what status they are in (e.x. AVAILABLE, FULL, ACTIVE...). If some of your media is marked "ACTIVE" (like mine was), then I have found that to be a situation of where NetBackup did not move the media to the scratch pool to be queued up for use in the next backup job.

I ran this command:

{% highlight bash %}
    /usr/openv/netbackup/bin/admincmd/bpexpdate -deassignempty
{% endhighlight %}

To grab all of the "ACTIVE" media and move it to the scratch pool since the images on each of the "ACTIVE" media is expired.
Run the job manually, and backups are flying.
Here are some other commands that I have found useful if you are low on budget and do not have a barcode scanning tape changer:

{% highlight bash %}
    /usr/openv/volmgr/bin/vmphyinv -rn 0 -verbose
{% endhighlight %}

I have found using this command will do a physical inventory of your tapes is better than using the GUI interface with the possibility of the "use barcode rules" is turned on by default and then it adds new media to your catalog (when you really have not done so).
