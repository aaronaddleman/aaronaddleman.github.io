---
layout: post
title: "RVM with OS X Mountain Lion"
description: "When moving into OS X Mountain Lion, I wrote down some notes of getting Ruby with RVM along with some issues I experienced."
tags: [osx, ruby]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

When installing RVM, I found some issues after resetting my environment. Most of (if not all) of my problems had to do with Brew not having the necessary links.

Most of the time the problem had to do with an libssl package not being loaded. To fix the problem, I ran the following programs below to relink the libraries.

    brew unlink (package complaining)
    brew link (package complaining)
