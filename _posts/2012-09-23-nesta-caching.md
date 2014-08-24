---
layout: post
title: "How to enable caching in Nestacms 0.9.13"
description: "Getting around an error message and turning on caching in Nesta 0.9.13"
tags: [nesta]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# How to enable caching in Nestacms 0.9.13

## Summary

I wanted to turn on caching but got a bad error message (along the lines of "calling to a private method 'public' is not allowed") so I decided to try a test of renaming the method to one that is allowed. So after investigating around in the Nesta gem of files I made the following changes in the cache.rb file:

## change #1

### old block

    :::ruby
    def cache_page_path(path,opts={})
      # test if given a full path rather than relative path, otherwise join the public path to cache_dir 
      # and ensure it is a full path
      cache_dir = (settings.cache_dir == File.expand_path(settings.cache_dir)) ? 
          settings.cache_dir : File.expand_path("#{settings.public}/#{settings.cache_dir}") # <--- old line
      cache_dir = cache_dir[0..-2] if cache_dir[-1,1] == '/'
      "#{cache_dir}/#{cache_file_name(path,opts)}"
    end

### new block

    :::ruby
    def cache_page_path(path,opts={})
      # test if given a full path rather than relative path, otherwise join the public path to cache_dir 
      # and ensure it is a full path
      cache_dir = (settings.cache_dir == File.expand_path(settings.cache_dir)) ? 
          settings.cache_dir : File.expand_path("#{settings.public_dir}/#{settings.cache_dir}") # <--- new line
      cache_dir = cache_dir[0..-2] if cache_dir[-1,1] == '/'
      "#{cache_dir}/#{cache_file_name(path,opts)}"
    end


## change #2

At the bottom of the cache.rb file, add the two new lines:

    :::ruby
    def self.registered(app)
      app.helpers(Cache::Helpers)
      app.set :cache_enabled, true
      app.set :cache_page_extension, '.html'
      app.set :public_dir, 'public'         # <--- new line #1
      app.set :cache_dir, 'public/cache'    # <--- new line #2
      app.set :cache_logging, true
      app.set :cache_logging_level, :debug
    end
