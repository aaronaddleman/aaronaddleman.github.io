---
layout: post
title: "Ruby's 'Interesting methods'"
description: "While in IRB and listing methods on an object, adding this new method to the Object allows for helpful listing of methods."
tags: [ruby]
image:
  feature: 8160237453_62c4c8c48e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Why

When using Ruby's IRB tool to investigate some code you have the power to list of the methods that are available on objects. You can do this by typing the object's name followed by a "." and then hitting the tab button. While this is nice, it happens to list all of the methods. Below is a nice way of removing the methods from the object called Object and then you are showed only the "interesting_methods" that might be relevent.

## How

Here is how to create the method into the class of Object:

{% highlight ruby %}
class Object
  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end
{% endhighlight %}