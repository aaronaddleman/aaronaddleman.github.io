---
layout: post
title: "Locking your shell"
description: "Managing file locks within Bash is so helpful"
tags: [programming]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
toc: true
---

## What

Manage your file locks with the program `flock` when executing bash shells.

## Why

When running commands with bash, its super helpful to ensure that the command can only be executed once while in the background and not have multiple copies being executed. `flock` helps with managing the file lock.

## How

The man page on flock provides some helpful examples of using the command flock from the console and from inside a shell. Below are the first two examples showing how run from a command prompt. The third example shows how to use the utility inside a bash script.

      ```
       flock [-sxon] [-w timeout] lockfile [-c] command...
       flock [-sxon] [-w timeout] lockdir [-c] command...
       flock [-sxun] [-w timeout] fd
      ```
      
Here is what I used for my shell script to execute a command:

#!/bin/bash

# casperjs --ssl-protocol=tlsv1 merakiScrape.js

```
(
  # Wait for lock on /var/lock/.myscript.exclusivelock (fd 200) for 10 seconds
  flock -x -w 10 200 || exit 1

  # ... commands executed under lock ...
  ruby ./bin/ruby_program.rb

) 200>/var/lock/.my_ruby_program.sh.exclusivelock
```
