---
layout: post
title: "Create Yosemite USB boot drive"
description: ""
tags: [programming]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

To make a bootable USB boot drive for installing onto a mac.

## Why

When you want to reinstall Yosemite after wiping the hard drive for a plain install.

## How

Get a USB drive. I recommend getting one that has more than 16 GB of storage. Format the drive with the Disk Utility application and keep it named “Untitled”. Then open the Terminal.app and run the following:

```bash
sudo /Applications/Install\ OS\ X\ Yosemite.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ OS\ X\ Yosemite.app --nointeraction
```

## When

1. i want to erase my computer
1. to just start from 0 all over again