---
layout: post
title: "Using Ruby to check redirects"
description: "When you have many redirects to test, automate it with ruby and typhoeus."
tags: [ruby]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Using Ruby to check redirects

While writing the script, I first stared out with net/http. This was going pretty slow and when I had 1900+ urls to verify, I calculated it would take approximately 2 hours to complete. While that was acceptable I found out that a lot of links were broken which translated into running this script more than 10 times to re-verify. So I did some searching around and found the gem "typhoeus". Very cool gem indeed. This made things go much faster. I included both snippets of code in my script to show progression and for note gathering.

Here is my code:

{% uvhighlight lang=ruby file=/assets/files/check_redirection.rb %}
{% enduvhighlight %}
