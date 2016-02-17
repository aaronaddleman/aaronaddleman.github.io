---
layout: post
title: "Monitoring log files visually with logstalgia or gltail"
description: "Looking at log files visually with logstalgia or gltail."
tags: [sysadmin]
image:
  feature: IMG_5040.jpg
  credit: Aaron Addleman
comments: true
share: true
---

Log files can sometimes get boring. But monitoring them visually can make them awesome. There are two tools that I have found which provide a visual look at log files: **[logstalgia][logstalgia_link]** or **[gltail][gltail_link]**.

# Logstalgia
## Summary
Very cool program that takes the log file and sets up two columns on the far left and far right. On the far left is the host who has requested the resource and a small round ball goes across to the right column. On the right column is the resource that the host has requested while the ball size represents the size of the request. When the ball moves across the screen and reaches the right side column the status code appears. Most status codes bounce off a moving paddle, while others like a 404 or 403 status code continue through. This visual difference between good status codes and not so good status codes is one of the main benefits of using the visual tool, in my humble opinion. Some other benefits are the size of the ball, amount of hosts on the left side, and amount of resources used per host being represented by the total count of balls flying around.

## Installing on Mac OS X

Here are the steps necessary for building [logstalgia][logstalgia_link]

### The short summary
1. Install brew
2. Install the necessary recipies using brew
3. Download [logstalgia][logstalgia_download]
3. Run `./configure`
4. Run `make`

### Straight up commands (after installing brew)

    {% highlight bash %}
    (cd to the logstalgia source directory)
    brew install ftgl
    brew install sdl
    brew install sdl_image
    brew install pcre
    brew install libpng
    brew install jpeg
    ./configure
    make
    ./logstalgia data/example.log
    {% endhighlight %}

## Running logstalgia
### 


# Gltail
## Summary
Built on ruby makes this project a little easier to install. It helps if you have the [RVM][rvm_link] manager installed because there is a `.rvm` folder inside the main directory of gltail. The `.rvm` folder switches over to Ruby 1.9.2-p290 when changing directories. Its really great when that all works out after you are prompted to trust the `.rvm` folder. Features about this visualizer is its customization, pulling from multiple log files from multiple hosts, defining the layout, and visual attributes. Its very similar to logstalgia, but with greater configuration.

## Installing on Mac OS X


[logstalgia_link]: https://code.google.com/p/logstalgia/
[logstalgia_download]: /public/files/logstalgia-1.0.3.tar.gz
[gltail_link]: http://www.fungie.org
[rvm_link]: http://rvm.io
