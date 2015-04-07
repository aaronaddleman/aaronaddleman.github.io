---
layout: post
title: "Identify duplicate entries in array and append a number to create uniqueness"
description: "When you have an array with items that are duplicates and you want to number the duplicates sequentially, this code will help take care of the job. It might not be be most efficient way, but it works."
tags: [ruby]
image:
  feature: 9553056715_0a418a1852_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

When faced with an array with duplicate items and the output needs to be unique, the following code loops through the items and addes it to the h hash with a value being the count of duplicates. Next, the each loop adds a number at the end making the items become unique.

{% highlight ruby %}
@items = [
  "topic number one",
  "topic number two",
  "topic number two",
  "topic number three",
  ]

h ={}

puts @items.each{|e| h[e] = h[e].nil? ? 1 : h[e]+1}

puts h.inspect

@counter = 0
@items.each do |item|

  if h[item] > 1
    p "#{item}-p#{@counter += 1}of#{h[item]}"
  else
    p "#{item}"
  end
end
{% endhighlight %}