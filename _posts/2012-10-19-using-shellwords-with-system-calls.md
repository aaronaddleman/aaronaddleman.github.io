---
layout: post
title: "Escaping string for sending to command line or shell (and other uses)"
description: "The built in library, Shellwords, in Ruby 1.9 is very useful when sending strings to the command line. Here are some examples of how to use the library."
tags: [ruby]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Escaping string for sending to command line or shell (and other uses)

In Ruby 1.9 the library [Shellwords][1] has some useful methods to help translate between the program and the command line interface. When sending strings to the cli, some characters are not well received as they are reserved for use by the shell program. To use the characters, you must escape them. This is where the [Shellwords][1] becomes useful.

## Example to escape command with arguments

    :::ruby
    require 'shellwords'
    
    
    open('|' + ['grep', pattern, *files].shelljoin) { |pipe|
      # ...
    }
    
    # or
    
    open('|' + Shellwords.join(['grep', pattern, *files])) { |pipe|
      # ...
    }
    
    # or
    
    url = "http://domain.com/path/to/page.html"
    filename = "output.cfm"

    command = ['/opt/local/bin/wget', url, '-O', filename].shelljoin
    system(command)

## Example of splitting string with quotes embedded

This is pretty cool as I could see this being useful for just making an array from a string that contains a mix of text and quoted text

    :::ruby
    require 'shellwords'
    
    argv = Shellwords.split('here are "two words"')
    argv #=> ["here", "are", "two words"]
    
    or
    
    argv = 'here are "two words"'.shellsplit
    argv #=> ["here", "are", "two words"]

[1]: http://www.ruby-doc.org/stdlib-1.9.3/libdoc/shellwords/rdoc/Shellwords.html
