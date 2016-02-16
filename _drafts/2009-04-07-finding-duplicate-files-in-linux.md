---
layout: post
title: "Finding duplicate files with different letter case in linux"
description: ""
tags: [cli]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


When dealing with files on *nix, there is rarely the need for concern of duplicate file names with different letter case. But, when you are in Windows, you do need to be concerned. This all boils down to what file system you use. And I used this command when I needed to find out an error message in subversion that complains about unable to copy a file when checking files out from subversion repository on Windows:
(fyi, I used this command on Linux to find the duplicate)
(another fyi, this does <strong>not</strong> work on OS X)

{% highlight bash %}
    find . -type f -printf "'%p'\n" | sort -n | uniq -Di
{% endhighlight %}
