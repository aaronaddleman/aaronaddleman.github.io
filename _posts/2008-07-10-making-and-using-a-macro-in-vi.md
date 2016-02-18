---
layout: post
title: "making and using a macro in vi"
description: ""
tags: [vi]
image:
  feature: 8160262732_04666c38b1_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I always forget or make a mistake on how to make a macro in VI so today I noticed that I kept on messing up too much and this has gone on way to long:

1. put the cursor where you want to start recording
1. make sure your in command mode
1. type the letter "q" then choose a letter between a-z or A-Z to assign the macro
1. you should notice the "-recording-" message in the status bar
1. do your actions that you want in the macro
1. if you use the insert command make sure to use "esc" to get out of insert mode before ending the macro
1. end the macro by pressing "q"

to use the macro:

1. position the cursor where you want to use the macro
1. type "@" then the letter you choose for your macro

to repeat the macro many times:

1. position the cursor where you want the macro to repeat
1. type a number
1. type "@"
1. then type the macro letter

here is an example of howto use the # symbol to comment out a line for 300 lines:

1. type "q"
1. type "a" (assigns the macro to this letter)
1. type "i" (go to insert mode)
1. type "#" (to insert the comment)
1. type esc to get out of insert mode
1. type "h" to move one character to the left
1. type "j" to move one line down
1. type "q" to end the macro
1. type "300" then "@" then "a" to repeat the macro 300 times
