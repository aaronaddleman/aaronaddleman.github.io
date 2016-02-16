---
layout: post
title: "Puppet Notes and Examples"
description: ""
tags: [puppet]
image:
  feature: IMG_0605.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Simple and helpful commands

### To display the current version installed

{% highlight bash %}
puppet -V
{% endhighlight %}
    
### To run the agent and see debug information

{% highlight bash %}
# run the puppet agent manually and see the output
puppet agent --test --debug
{% endhighlight %}

### To list all of the types

{% highlight bash %}
# list all of the types available
puppet describe --list
# display information on the type
puppet describe file
puppet describe exec
{% endhighlight %}

### Filebucket: backup and restore

{% highlight bash %}
puppet filebucket backup /etc/passwd
/etc/passwd: 429b225650b912a2ee067b0a4cf1e949
puppet filebucket restore /tmp/passwd 429b225650b912a2ee067b0a4cf1e949
{% endhighlight %}
