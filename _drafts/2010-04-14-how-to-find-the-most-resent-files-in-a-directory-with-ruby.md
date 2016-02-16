---
layout: post
title: "How to find the most resent files in a directory with ruby on one line"
description: ""
tags: [programming]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


I had to find some files for processing and wanted to find the latest file by modification date. So here is what I came up with:

{% highlight ruby %}
    Dir.glob("c:/path/to/files/*.*").sort_by {|f| File.mtime(f) }.reverse[0..7]
{% endhighlight %}

# Explanation

## grab the entries in the specified directory

{% highlight ruby %}
    Dir.glob("c:/path/to/files/*.*")
{% endhighlight %}

##pass the entries into the block for sorting

{% highlight ruby %}
    .sort_by
{% endhighlight %}

## sort by modification time

{% highlight ruby %}
    File.mtime(f)
{% endhighlight %}

## reverse the list and show 0 to 7 entries (which comes out to 8 entries)

{% highlight ruby %}
    .reverse[0..7]
{% endhighlight %}
