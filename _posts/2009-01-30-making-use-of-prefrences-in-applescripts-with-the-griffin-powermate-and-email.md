---
layout: post
title: "Making use of preferences in AppleScripts with the Griffin PowerMate and email"
description: ""
tags: [programming]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Okay, I own a PowerMate gadget that I have not used in a very very long time. So this afternoon I deiced to play with it and make a couple of scripts that help me at work.

My first task was to make the thing pulse when I have unread email in my inbox. After some simple searching I found a nice entry at macosxhints.com about the script. I also found some smart posts that contained some very efficient apple scripts. One them had a nice idea of using the "say" command to make the mac speak some text! I found this to be very entertaining and started to think how I could use this when I wanted to. Just a little side note: I have decided to stop checking my email ever 10 seconds and move that to 10 minutes. I find that checking email or seeing that I have unread email ever 10 seconds or so is very disruptive in the moment of my thoughts and projects. So I have decided to increment my email checking to 10 minutes for now. I might even increase this to 20 minutes. Not sure yet. Back to the script. I liked the idea of a script telling me when it was checking my email but I wanted to have the ability to toggle this on and off with a preferences setting. After a little searching, I found a great idea and put it to good use. It was so good that I had to write it down because I know I will be trying to implement this in future scripts.

## Script

{% highlight applescript %}
    set mac_speak to (do shell script "defaults read com.AaronsAppleScripts.pref 'macSpeak'")
    if mac_speak is "true" then
      say "Processing email"
    end if

    try
      tell application "System Events" to 
      if (exists process "Mail") is false then
        set theCount to 0
      else
        tell application "Mail" to set theCount to unread count of inbox
      end if

      if theCount &gt; 0 then
        tell application "PowerMateDaemon" to set pulse always to true
      else
        tell application "PowerMateDaemon"
          set pulse always to false
          set brightness to 0
        end tell
      end if
    end try

    if mac_speak is "true" then
      say "Finished"
    end if
{% endhighlight %}

## Explanation of the preferences

To use the preferences here are the following examples of commands to type in your terminal:

### set the value to true:

{% highlight bash %}
    defaults write com.AaronsAppleScripts.pref 'macSpeak' 'true'
{% endhighlight %}

### set the value to false:

{% highlight bash %}
    defaults write com.AaronsAppleScripts.pref 'macSpeak' 'false'
{% endhighlight %}

### read the preference:

{% highlight bash %}
    defaults read com.AaronsAppleScripts.pref 'macSpeak'
{% endhighlight %}

### use preferences inside apple scripts:

{% highlight bash %}
    do shell script "defaults read com.AaronsAppleScripts.pref 'macSpeak'"
{% endhighlight %}
