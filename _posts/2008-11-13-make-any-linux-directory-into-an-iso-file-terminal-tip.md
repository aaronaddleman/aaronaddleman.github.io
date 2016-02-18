---
layout: post
title: "Make Any Linux Directory into an ISO File [Terminal Tip]"
description: ""
tags: [system]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Make Any Linux Directory into an ISO File [Terminal Tip]

I like stuff like this so I figured I would write it down here for later reference. Making iso's are helpful because not only are you able to make a cdrom out of them, I find they are great for storage as well. I think there is a big need for a backup application that makes isos for you automatically. Then you got a nice workflow for moving them off to physical media when your storage volume starts to get full.

{% highlight bash %}
    mkisofs -V LABEL -r DIRECTORY | gzip > cdrom.iso.gz
{% endhighlight %}
