---
layout: post
title: "Chef knife queries"
description: "Using chef knife queries to set attributes"
tags: [chef, sysadmin]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Searching for nodes by attributes

{% highlight bash %}
knife search node "tags:app AND tag2:value1 AND (tag3:v4 OR tag3:v5 OR tag3:v6)"
{% endhighlight %}

## Setting a local attribute to a new value

{% highlight bash %}
knife exec -E "nodes.find('tags:app AND tag2:value') { |n| puts n.name; n.set[:app][:attribute] = 'new_vale'; n.save  }"
{% endhighlight %}