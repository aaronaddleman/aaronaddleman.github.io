---
layout: post
title: "Find latest file ending with a number with Ruby"
description: "Finding the latest file that ends with a number from a list of archives with Ruby came in helpful when writing some code. Read more to find out what it looks like."
tags: [ruby]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Find latest file ending with a number with Ruby

    :::ruby
    Dir.entries(shared_path + '/database_dumps').drop(2).sort_by |s|
      s.scan(/\d+/).map{|s| s.to_i}.last
    end


# Broken down in english

Using the Dir class to use the method "entries" to look in the path, drop the first two entries "." and "..", sort by the results of the scan of \d+ (digits converted to an integer "to_i"). After all that, return the last value which should be the highest number.
