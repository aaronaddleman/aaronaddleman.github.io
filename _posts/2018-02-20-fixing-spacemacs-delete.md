---
layout: post2
title: "Fixing Spacemacs delete function"
description: "While in Evil mode, sometimes Spacemacs does not allow for delete. Here is the fix."
tags: [spacemacs]
image:
  feature: https://farm5.staticflickr.com/4711/24850125997_483c612e3c_k.jpg
  credit: Aaron Addleman
comments: false
share: true
---

## what

Your "d" command key deletes two lines instead of one single line. Your mad, and frustrated but dont want to quit and reload like a regular person. Here are is one solution.

## why

I have yet to come up with why this occurs. Your editing in your spacesmacs editor in Evil mode for a while, but then this happens.

## how

Use the following to fix:

1. Highlight a line
1. Delete the one line
1. Undo

```
Shift + V
d
u
```

My `d` command has now been restored.
