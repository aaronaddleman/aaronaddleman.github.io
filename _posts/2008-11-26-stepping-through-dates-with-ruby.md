---
layout: post
title: "stepping through dates with ruby"
description: "An alternative method to stepping through dates with ruby"
tags: [ruby]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


When I wanted to download all of my transactions from my bank, they put a limit of how many transactions I can download. This was frustrating because the limit has been set to be 90 days between the start date and the end date.

I could have done this by hand, but I wanted to push myself to learn how to do it in ruby. After reading the api on ruby about the (date.rb class)[http://www.ruby-doc.org/stdlib/libdoc/date/rdoc/index.html], I came up with my own method to calculate dates:

{% highlight ruby %}
  #!/usr/bin/env ruby
  require 'date'
  def print_sundays(d1, d2)
    d1 +=1 while (d1.wday != 0)
    d1.step(d2, 7) do |date|
      puts "#{Date::MONTHNAMES[date.mon]} #{date.day}"
    end
  end
  # print every sunday between 2001,1,1 and 2008,11,26
  print_sundays(Date::civil(2001, 1, 1), Date::civil(2008, 11, 26))
  def print_next_x_days(s1, e1, x)
    s1.step(e1, x) do |date|
      puts "#{date.year} #{Date::MONTHNAMES[date.mon]} #{date.day}"
    end
  end
  # after 2001,1,1 print the date after 89 days until 2008,11,26
  print_next_x_days(Date::civil(2001, 1, 1), Date::civil(2008, 11, 26), 89)
{% endhighlight %}