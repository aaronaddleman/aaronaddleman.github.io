---
layout: post
title: "Stuff about vagrant and test kitchen"
description: ""
tags: [vagrant, test-kitchen, chef]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---

## What

When using Vagrant and Test-Kitchen, there are some settings that are useful.

## Why

Using Vagrant allows you to set networking ports, cpu limit, and network port forwarding. You can do this with Test-Kitchen too, by using 'kitchen-vagrant'.

## How

With your project directory that contains the `.kitchen.yml` file, we can use the following to allow for passing options to vagrant:

{% highlight yaml %}
{% endhighlight %}