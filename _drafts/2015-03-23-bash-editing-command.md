---
layout: post
title: "Bash command editing"
description: "When your command line gets too long, use your editor!"
tags: [linux]
image:
  feature: IMG_0601.JPG
  credit: Aaron Addleman
comments: true
share: true
---

## What

Edit your really long line of command with your editor to make updating easier.

## Why

Take advantage of your editor's power to move/search/modify your command to your editor's heart content.

## How

When running BASH and you our command is way too long, type: 

`CTRL + x e`

That is to say, hold down `ctrl` the entire time, type `x`, then type `e`. Your console should bring in your current command into the editor defined with $EDITOR. Once you have made your edits, save the file and when you quit, the command should be echoed back into your console and executed.

This would also make it much easier to chain commands together from various sources of documentation.