---
layout: post
title: "Making MacVim fullscreen"
description: ""
tags: [vi]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I like fullscreen anything. So tonight when I sat down to learn at least one new thing about vim, I came across lots of stuff, but I will only talk about the fullscreen one for now. To enter fullscreen, the vim people chose the best chars ever:

{% highlight bash %}
    :set fu
{% endhighlight %}

This will bring you into full screen mode!!! The characters "fu" as in kung fu are awesome. I'm not sure you are sharing the same excitement that I have, but I wanted to share =D

Now, I also found out that while this is great for vertical space, I was left with lots of horizontal space ... booo. But wait!! Setting the option of:

{% highlight bash %}
    :set fuopt+=maxhorz
{% endhighlight %}

will make your fu go maximum on the horizontal plane.

All of these options are fantastic and I think they will be very happy in my .vimrc file. Incase anyone wondered what I added, here are the lines:

{% highlight bash %}
    set fuopt+=maxhorz                     " grow to maximum horizontal width on entering fullscreen mode
    macmenu &amp;Edit.Find.Find\.\.\. key= " free up Command-F 
    map <d> :set invfu                     " toggle fullscreen mode
{% endhighlight %}
