---
layout: post
title: "Emacs"
date: 2015-06-08
description: ""
tags: [emacs]
image:
  feature: 11786474283_9f0f30e96c_o_m.jpeg
  credit: Aaron Addleman
comments: true
share: true
---

## Have to start somewhere

Okay. It has been a long time now that I have needed to learn EMacs. So I have created a task for myself to learn one new thing about EMacs every day. So while this might be a repeating simple and stupid tasks, I have decided to log them down into a tag collection so that later on I can review them for enhancing and memory.

Currently I am using Carbon Emacs on my mac book pro. So far I have not used it much but in the past couple of days, I have been forcing myself to get out of my patterns and into something new.
The tags I will be using to cover all of the things I learn on the way will be "lessons emacs".
Hopefully, I can keep all this in my head!

## Day 1: Movements

### By words

`M-5` `M-f`

Just like in ViM, you can send numerics to commands. This is helpful for doing planned moves. One example is _move by word_ where `M-5 M-f` will advance you 5 words with some attempt at identifying actual words. I tried to test this, but got mixed results.

`M--` `M-5` `M-f`

Moving backwards in with planned numeric value make use of the negative glyph character. By typing `M--` (meta with a dash) followed by a `M-2` and a command of `M-f` you will be moved back two words.


### By line

`C-p` or `C-2` `C-p`

Moving to the previous line by one or a planned value of lines.

`C-n` or `C-2` `C-n`

Moving to the next line or by a planned value of lines.

`C-a`

Move to the beginning of the current line.

`C-e`

Move to the end of the current line.

## Day 1: Deleting

### By line

`C-k` or `C-2` `C-k`

Delete an entire line or a series of lines from cursor going down to end of line.

`C-S-backspace`

Delete the entire line from beginning to end.

`C--` `C-2` `C-S-backspace`

Delete the previous two lines from where the cursor currently resides.

## Day 1: Saving

`C-x` `C-s`

Save the current outstanding changes of the buffer to a file on disk.

## Day 1: Windows

> `M-x` `kill-window`
> 
> To close a window that the current cursor is on.

## Day 1: Frames

`C-x` `1`

