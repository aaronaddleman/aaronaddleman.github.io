---
layout: post
title: "Setting custom ruby binary in Sublime Text 2"
description: "When making scripts in Sublime Text 2 and running Cmd+B sometimes you want to use a custom version of ruby. How do you do it?"
tags: [sublime-text-2, ruby]
image:
  feature: IMG_0568.JPG
  credit: Aaron Addleman
comments: true
share: true
---


By editing the following file, you can define your ruby binary for building ruby scripts. The following is an example of what what I use for my Mac Book Pro:

edit command:

    subl ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Ruby/Ruby.sublime-build

contents of the file:

    {
      "cmd": ["/Users/aaron/.rvm/rubies/ruby-1.9.2-p320/bin/ruby", "$file"],
      "file_regex": "^(...*?):([0-9]*):?([0-9]*)",
      "selector": "source.ruby"
    }
