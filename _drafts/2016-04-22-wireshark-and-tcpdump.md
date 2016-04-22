---
layout: post
date: 2016-04-22
title: "Capturing with Wireshark"
description: "How to capture traffic with Wireshark remote or local and some other notes"
tags: [networking]
image:
  feature: IMG_5130.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

Using the powers of Wireshark for capturing data on the wire.

## Why

There are many different ways to capture data with Wireshark, some of which can be helpful. Here are some methods for capturing.

## How

Below are some examples of capturing data that I have done over the years which have proven helpful.

### simple capturing while excluding SSH traffic and DNS traffic

`tcpdump -i eth0 -s0 port not 22 and port not 53`

### capturing from remote host with Mac

1. Create your pipe with `mkfifo capturefile`
1. Run wireshark with `wireshark -k -i capturefile &`
1. Start your capture with `ssh root@hostname.domain.com "tcpdump -i eth0 -p -n -s0 -w - port 80" > capturefile

Wireshark should now be able to report the contents of the capture.
