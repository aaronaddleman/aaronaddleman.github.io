---
layout: post2
title: "Running an emacs server on OS X"
description: ""
tags: [emacs]
image:
  feature: https://c8.staticflickr.com/6/5717/30441913711_e73cdb6400_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

How to run a Emacs server on the Mac OS.

## Why

To make the startup time for Emacs shorter.

## How

```
brew install emacs --with-cocoa --with-gnutls --with-imagemagick --with-dbus --with-librsvg --with-mailutils
```

After installation, start the process in the backgroun with the following:

```
/usr/local/bin/emacs --daemon
```

This will load any Lisp code and have it ready for use when the client connects. To connect a client, run the following:

```
emacsclient -c
```

then run

{% highlight bash %}
    sudo launchctl load -w /Library/LaunchAgents/gnu.emacs.daemon.plist
{% endhighlight %}
