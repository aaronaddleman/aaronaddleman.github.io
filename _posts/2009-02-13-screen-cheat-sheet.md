---
layout: post
title: "screen cheat sheat"
description: ""
tags: [sysadmin]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I have forgotten all about screen. Here are some reasons why I like using this program:

* when your network cuts out, screen keeps the jobs running (very good for vpn users or if need to reload your firewall rules)
split screen of terminals, good for having shells open on a single window and monitoring activity
* low memory and blazing fast

My biggest problem is that I never actually dived in to screen and what the powers that it holds. That is all going to change with this post. Lets see how far I can push screen into my daily tasks at work.

## Task 1: Running a long job and logging off

### Problem

I have an upgrade command that needs to be executed but I know it will take several hours (even a day or two) to reach completion. Since I am using ssh to login to the server, I would like to log off the computer and shutdown my workstation before I go home (because I am using a laptop). I know some one might say "just make it goto the background" or "use nohup" but these all have potential for being killed if your network gets cut.

### Solution

Screen to the rescue! Use the following steps to start the long process and detach:

{% highlight bash %}
    ssh username@hostname
    screen
    ./long_process.sh
    (press CTRL + A)
    (press D)
    exit
{% endhighlight %}

You should now be back at your prompt and be able to safely exit the host while your long process keeps running. To reconnect, use the process below titled "Reconnecting to an existing session".

### Explanation

In step 1. we connect to the box. Step 2. we launch the screen program with step 3. launching the long process. Step 4. is where we use screens power to invoke the command mode and in step 5. press the letter D for Detaching from the screen session. Rest of the steps are logging off... just to be complete, I don't really know why I wrote them in.

## Task 2: Reconnect to an existing session

### Problem

There is already an existing screen session running and I need to reconnect to it.

### Solution
Lets first list all of the sessions that are active with there status:

{% highlight bash %}
    screen -list

    There is a screen on:

    41960.ttyp0.rock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Attached)
    1 Socket in /tmp/screens/S-aaron.
{% endhighlight %}

Now lets connect to that session:

{% highlight bash %}
    screen -r
{% endhighlight %}

## Task 3: Making a new window terminal in your screen session

To make a new window terminal in screen, use the following keyboard command:
    
{% highlight bash %}
    C-a C-c
{% endhighlight %}

## Task 4: Switching to the previous terminal screen window

To quickly switch between your previously used screen window use the following:

{% highlight bash %}
    C-a C-a
{% endhighlight %}

## Task 5: Show a list of windows to select from

To present a list of windows to choose from, use the following:

{% highlight bash %}
    C-a "
{% endhighlight %}

Then use the arrow keys up and down to highlight another window.
