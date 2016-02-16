---
layout: post
title: "Ruby code for printing links from a list of tags which also happens to be my list of plugins for wordpress to make into a CMS"
description: ""
tags: [programming]
image:
  feature: 9553056715_0a418a1852_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>This is a very very simple script and I think it can be vastly simplified, especially with some type of API. But I like finding out new ways of using Hpricot to scrub HTML. Anyways, recently I was asked to build a list of plugins for use with WordPress and then share with my co-workers. I could have just sent them the link to the tag, but I thought a list of urls would be helpful too. Here is the code:
<code>
require 'rubygems'
require 'hpricot'
require 'open-uri'
@base = "http://www.delicious.com/ocyrus/wplist"
def get_hrefs(number)
doc = Hpricot(open(@base + "?page=#{number}", :proxy =&gt; 'http://proxy.domain.com:80'))
doc.search("//a[@class='taggedlink &nbsp;']").each do |t|
p t.attributes['href']
end
end</code>
<code> </code>
<code>(1..5).each do |entry|
get_hrefs(entry)
end
</code></p>
