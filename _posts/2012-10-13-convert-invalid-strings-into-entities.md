---
layout: post
title: "Convert invalid strings into entities"
description: "When scraping content, sometimes a invalid character is contained in the content. In this article, I show some code that I used to convert the invalids into entities using the htmlentities gem package."
tags: [ruby, wordpress]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Convert invalid strings into entities

# Summary

While scraping content from a website, I ran into a large problem with content containing invalid characters. These were characters like the "medium-dash", apostrophe from a Microsoft Word document, and other strange characters (excluding math operations). With my script grabbing the content and putting it into Wordpress, they were all converted into three characters that looked really bad.

# Solution

## Attempt 1 (outcome = okay, but too many variations)

I tried to use gsub to replace the characters, but this started to get long and out of control and at some point, it stopped to work on the count of I could not target the invalid character.

## Attempt 2 (outcome = not good)

Forcing the ruby script to work in UTF-8 only did not help either. This seemed to have no effect by adding the following to the top of my script files:

    :::ruby
    #!/usr/bin/env ruby -w
    # encoding: UTF-8

## Attempt 3 (outcome = better)

Using ruby string#encode to convert the invalids did work, but it converted some items and others were just deleted. Below is an example of how I used the code:

    :::ruby
    string.encode Encoding.find('ASCII'), {
      :invalid           => :replace,  # Replace invalid byte sequences
      :undef             => :replace,  # Replace anything not defined in ASCII
      :replace           => '',        # Use a blank for those replacements
      :universal_newline => true       # Always break lines with \n
    }

## Attempt 4 (outcome = very good)

I came across the library called [htmlentities][1] and with a little testing I found a great combination of what I wanted to do with the scrapped content. First, the code takes the inner html and encodes the invalid characters. Then I use gsub to return some of the entities back into what I would like to use for Wordpress content to uphold the html classes, tags, and design.

    :::ruby
    require 'htmlentities'
    
    HTMLEntities::new::encode(results.inner_html, :basic, :named, :decimal).gsub("&lt;", "<").gsub("&gt;", ">").gsub("&#10;", "").gsub("&quot;", "\"")
    
I might try to use the results.inner_text but this works great for this project.

## Attempt 5 (outcome = better than attempt 4)

I finally realized that in the case you have a document that contains entities and characters that should be in entity form, you need to decode the entities first, then encode all of the characters that need to be in entity form.  Not sure why 'htmlentities' does not do this automatically, but oh well. Below is an example of what I like to do in my code:

    :::ruby
    require 'htmlentities'

    decoded_value = HTMLEntities::new::decode(value)
    HTMLEntities::new::encode(decoded_value, :basic, :named, :decimal).gsub(/\s\s+/, " ").gsub(/&#10;/, "")

[1]: http://htmlentities.rubyforge.org/ "Html Entities"
