---
layout: post
title: "Making apache modules load with better config while using a nice bash trick to parse with $IFS"
description: ""
tags: [system]
image:
  feature: IMG_0601.JPG
  credit: Aaron Addleman
comments: true
share: true
---

# Making apache modules load with better config while using a nice bash trick to parse with $IFS

When keeping your Apache configuration clean, I like to use the Ubuntu example of loading all of the modules from includes by using:

{% highlight apache %}
    Include ../mods-enabled/*.conf
{% endhighlight %}

Inside each of these .conf files is a line that loads the module like:

{% highlight apache %}
    LoadModule dir_module /usr/lib/apache2/modules/mod_dir.so
{% endhighlight %}

I like this idea because then all of your settings for each module on a global level are very well organized. But when all of your LoadModule commands are in one configuration file like I had, it can be annoying to get them all into individual files. But I would like to share with you how I moved my LoadModule lines from a text file, to individual files with the bash shell:

First, you have to set your $IFS variable, then use the next line to break out the individual lines into their separate files:

{% highlight bash %}
    IFS=$(echo -en "\n\b")

    for a in `cat modlist`; do FILE=`echo $a | awk '{print $2'} | sed -e 's/_module/.load/g'`; echo "$a" > $FILE; done
{% endhighlight %}