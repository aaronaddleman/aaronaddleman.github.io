---
layout: post
title: "Open files from the terminal into an external editor"
description: "If you are a mac user and like macvim, opening up files from the terminal into macvim is what this article is about"
tags: [os-x, bash]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Open files from the terminal into an external editor

When using Mac OSX there are times when opening a file from the terminal into your favorite editor is necessary. This is accomplished by using the .profile file located in your home directory.

## Open files into MacVim

Add the following to your .profile and use "vim filename" top open the file into the external editor

    :::shell
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
    
Now when you want to edit files in your terminal use:

    :::shell
    vim thefilename.txt
    
and your MacVim editor will pop open with all its happyness.
    
## Open files in TextMate

To open files in TextMate, you have to create a link to the 'mate' program. This is easily done during the install, but sometimes I forget to do this. The next way that is pretty easy is to run the following in your shell prompt:

    :::shell
    sudo ls /Applications/TextMate.app/Contents/Resources/mate /usr/bin/mate
    
Now you are able to open folders and files into Textmate from the terminal using these commands:

    :::shell
    cd to/your/folder
    mate .
    
or

    :::shell
    cd to/your/folder
    mate thefilename.txt
