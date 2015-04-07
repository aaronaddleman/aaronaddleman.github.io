---
layout: post
title: "Quick Permissions Reporting"
description: "Sometimes a small list of permissions for all files in a directory is really helpful. Here are some commands to help out with printing the octal permissions mode for all files and counting the results."
tags: [bash]
image:
  feature: 8160237453_62c4c8c48e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

While in a directory and you are changing permissions, its really helpful to get a summarized report of all permissions used on the files. If you find a bunch of files have a permission of 777 it might be worth filtering them out and taking a closer look at options of being less permissive.

## Summary of permissions

The first command I came up with lists sorts the permissions then gets a count of each type which is useful for looking at the list in order of permissive. The lower number is a lower permission mode (at the top of the list) and the items going down progressively get more permissive.

{% highlight bash %}
$ find . -type f -exec stat -c "%a" {} \; | sort
{% endhighlight %}

## Summary of permissions sorted by count

This is command is pretty much the same as above but with some extra sorting to find the popular type of permissions (sorted by the uniqueness count):

{% highlight bash %}
$ find . -type f -exec stat -c "%a" {} \; | sort | uniq -c
{% endhighlight %}