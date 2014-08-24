---
layout: post
title: "Git Cheat Sheet"
description: "Over time, some of these commands for git have become helpful while working with repositories. The one I like most is when I want to do a true reset of not only files changed, but also files I have created. Other times, there are commands that help display information."
tags: [git, cheatsheets]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---
Flags: draft

# Git Cheat Sheet

## Resetting changes

Sometimes I have made an upgrade to a set of files which include adding new files and I want to undo all modifications to files and remove all new files. The following command help:

    
    git reset

After running this command I have noticed there could be some files left over that are not under git control. Instead of removing these files manually, I found the following command to help with clearing them out:

    git clear -fd

## Listing branches or tags

To get a listing of the branches or tags you can use these commands:

    git tag -l
    git branch -a

