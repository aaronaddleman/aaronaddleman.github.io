---
layout: post
title: "Testing with Siege"
description: "When trying to stress test your website, using a tool like siege helps simulate the traffic load."
tags: [programming]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Overview

I have started to use siege for some testing and found it to be useful for some things involving stress testing.

## OS X suggestions

Upon installing siege with `brew` I noticed a suggestion:

> Mac OS X has only 16K ports available that won't be released until socket
> TIME_WAIT is passed. The default timeout for TIME_WAIT is 15 seconds.
> Consider reducing in case of available port bottleneck.
> 
> You can check whether this is a problem with netstat:
> 
>     # sysctl net.inet.tcp.msl
>     net.inet.tcp.msl: 15000
> 
>     # sudo sysctl -w net.inet.tcp.msl=1000
>     net.inet.tcp.msl: 15000 -> 1000
> 
> Run siege.config to create the ~/.siegerc config file.

I made this change to my Mac but so far I have not noticed much difference. After modifying the ~/.siegerc file, I came up with an ideal set of options. Here is my settings:

        
    accept-encoding = gzip
    benchmark = false
    cache = true
    chunked = true
    concurrent = 15
    connection = close
    delay = 1
    expire-session = true
    fullurl = true
    gmethod = HEAD
    internet = true
    logfile = ${HOME}/log/siege.log
    logging = true
    protocol = HTTP/1.1
    quiet = false
    show-logfile = true
    spinner = true
    verbose = true
