---
layout: post2
title: "Spacemacs and buffers"
description: "When buffers go missing from helm-mini, I found the solution to bring them back."
tags: [spacemacs]
image:
  feature: https://c1.staticflickr.com/5/4245/34472742224_9785db703c_k.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

Buffers are the great thing in Emacs that allow the changing of data on your system of choice. We switch back and forth between multiple buffers all the time, and I have noticed that sometimes, the buffers disappear from the `helm-mini`. This has caused my great anguish as I would relaunch Spacemacs and all would be happy again. Until today. I set out to find a solution to his horrible situation.

The normal method for listing buffers is the command

```
SPC b b
```

then type in some matching characters and you can switch to the selected buffer.

## Why

I have yet to find out why the heml-mini is loosing the buffers. They are not actually lost, but rather just not being listed. I have found using the command `SPC SPC` and then executing the command `display-buffer` will show all of the buffers that Emacs has open. This seemed annoying to do. So I noticed another option in the buffers menu: `presp-add-buffer`. This solved the problem! When running this command, it brought the buffer to the perspective and now I can use `SPC b b` then type the letters of the buffer, and viola, buffer is displayed.

## How (tl;dr)

### Problem

buffer is missing

### Solution

`SPC b a` and type the name of the buffer you need, then hit enter

`SPC b b` to see that the buffer has been added
