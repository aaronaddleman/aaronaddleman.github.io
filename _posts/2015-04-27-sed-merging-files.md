---
layout: post
title: "Sed merging files"
description: "Using sed to insert a file after a pattern of text"
tags: [linux]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

Inserting text from a file after a pattern in a file.

## Why

Its like copying and pasting for Linux on the command line.

## How

Let's take the following file which is missing the entire body of the message. We will call this file email.txt.

{% highlight text %}
# email.txt

Hello,

Thanks,
Aaron Addleman
{% endhighlight %}

And let's also take the following 3 files for our messages:

### body1.txt

{% highlight text %}


Thanks for signing up with our service! Instructions will follow after you confirm your email address...
{% endhighlight %}

### body2.txt

{% highlight text %}


Can you please fill out this short survey?
{% endhighlight %}

### body3.txt

{% highlight text %}


Sorry to see you leave our service! Was it because of our survey?
{% endhighlight %}

To make email messages from all of these messages, you can use the following (make sure to use double quotes around the sed command for evaluating the bash variable):

{% highlight bash %}
for a in `ls body*`; do sed "/Hello/ r $a" email.txt; done
{% endhighlight %}

