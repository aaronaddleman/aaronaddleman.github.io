---
layout: post
title: "How to start RedHat ES 5 in single user mode"
description: ""
tags: [system]
image:
  feature: IMG_0601.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>When RedHat boots it presents to you a list of kernel's to boot from. By hitting the letter "e" you go into edit mode to provide more options to be passed to the selected kernel. Add the letter "S" to the end of the kernel options (make sure its all by itself, separated by spaces). Type the letter "B" to boot with the new option and booting will continue until at some point it will prompt you with a password for your root account. Type in the password and you should be in.
To get out and resume booting, type "exit".</p>
