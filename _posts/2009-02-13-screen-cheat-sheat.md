---
layout: post
title: "screen cheat sheat"
description: ""
tags: [cli]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


<p>I have forgotten all about screen. Here are some reasons why I like using this program:
</p>
<ol>
<li>when your network cuts out, screen keeps the jobs running (very good for vpn users or if need to reload your firewall rules)</li>
<li>split screen of terminals, good for having shells open on a single window and monitoring activity</li>
<li>low memory and blazing fast</li>
</ol>
My biggest problem is that I never actually dived in to screen and what the powers that it holds. That is all going to change with this post. Lets see how far I can push screen into my daily tasks at work.
<h3>Task 1 } Running a long job and logging off</h3>
<h4>Description:</h4>
I have an upgrade command that needs to be executed but I know it will take several hours (even a day or two) to reach completion. Since I am using ssh to login to the server, I would like to log off the computer and shutdown my workstation before I go home (because I am using a laptop). I know some one might say "just make it goto the background" or "use nohup" but these all have potential for being killed if your network gets cut.
<h4>Solution:</h4>
Screen to the rescue! Use the following steps to start the long process and detach:
<ol>
<li>% ssh username@hostname</li>
<li>% screen</li>
<li>% ./long_process.sh</li>
<li>press CTRL + A</li>
<li>press D</li>
<li>% exit</li>
<li>your now back at your workstation with ./long_process.sh running its merry little head off</li>
</ol>
<h4>Explanation:</h4>
In step 1. we connect to the box. Step 2. we launch the screen program with step 3. launching the long process. Step 4. is where we use screens power to invoke the command mode and in step 5. press the letter D for Detaching from the screen session. Rest of the steps are logging off... just to be complete, I don't really know why I wrote them in.
<h3>Task 2 } Reconnect to an existing session</h3>
<h3>Description:</h3>
There is already an existing screen session running and I need to reconnect to it.
<h3>Solution:</h3>
Lets first list all of the sessions that are active with there status:
<code>
screen -list
</code>
There is a screen on:
<br><br><code>
41960.ttyp0.rock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Attached)
1 Socket in /tmp/screens/S-aaron.
</code>
Now lets connect to that session:
<code>
$ screen -r
</code>
<h3>Task 3} Making a new window terminal in your screen session</h3>
<span style="font-family: terminal,monaco;">To make a new window terminal in screen, use the following keyboard command:</span>
<code>
C-a C-c
</code>
<h3>Task 4} Switching to the previous terminal screen window</h3>
To quickly switch between your previously used screen window use the following:
<br><code>
C-a C-a
</code>
<h3>Task 5} Show a list of windows to select from</h3>
To present a list of windows to choose from, use the following:
<code>
C-a "
</code>
Then use the arrow keys up and down to highlight another window.
