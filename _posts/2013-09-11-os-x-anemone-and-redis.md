---
layout: post
title: "Crawling a site with Anemone and Redis"
description: ""
tags: [databases]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## General

Using anemone allows for crawling a website from a ruby script.

## Installing Redis

Installing `redis` on Mac OS X 10.8 is easy (right now) with "Brew". By running the command:

    brew install redis

## Launching options

To have launchd start redis at login:

    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

Then to load redis now:

    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

Or, if you don't want/need launchctl, you can just run:

    redis-server /usr/local/etc/redis.conf
