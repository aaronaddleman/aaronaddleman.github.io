---
layout: post
title: "iTerm send hex code"
date: 2015-06-08
description: "How to configure iTerm to send hex codes for Tmux"
tags: [iterm]
image:
  feature: 11786474283_9f0f30e96c_o_m.jpeg
  credit: Aaron Addleman
comments: true
share: true
---

## iTerm and hex codes

When using iTerm, being able to configure

## Getting the hex codes

To get a hex code on a Linux based system, you can do the following:

{% highlight text %}
$ xxd -psd
{% endhighlight %}

This will put your terminal into a capture state. Now the program is waiting for you type in the characters for capture and hitting return. Below is an example on how to find a key combination for Tmux to goto the previous window which is the key combination of `ctrl + b` then `p` 

{% highlight text %}
Hiigara:~ aaddleman$ xxd -psg
^Bp
02700a
{% endhighlight %}

To end the capturing, use `ctrl + c`.

The resulting hex codes that have been returned are `02700a` and here is the breakdown on how to convert to hex codes:

| Text from xxd    | Converted to Hex | Keyboard buttons |
| ---------------- |:----------------:| ----------------:|
| 02               | 0x02             | `ctrl + b`       |
| 70               | 0x70             | `p`              |
| 0a               | 0x0a             | `Return`         |

`02` or `0x02` = `ctrl + b`

`70` or `0x70` = `p`

`0a` or `0x0a` = `Return`

Putting this all together (or partially together) in iTerm, you can create a custom key binding in iTerm to have a keyboard combination to switch between windows by sending a hex code of:

{% highlight text %}
0x02 0x70
{% endhighlight %}