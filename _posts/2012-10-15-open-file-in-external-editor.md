---
layout: post
title: "Open files from the terminal into an external editor"
description: "If you are a mac user and like macvim, opening up files from the terminal into macvim is what this article is about"
tags: [osx]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

When using Mac OSX there are times when opening a file from the terminal into your favorite editor is necessary. This is accomplished by using the .profile file located in your home directory.

## Open files into MacVim

Add the following to your .profile and use "vim filename" top open the file into the external editor

{% highlight bash %}
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
{% endhighlight %}
    
Now when you want to edit files in your terminal use:

{% highlight bash %}
vim thefilename.txt
{% endhighlight %}
    
and your MacVim editor will pop open with all its happyness.
    
## Open files in TextMate

To open files in TextMate, you have to create a link to the 'mate' program. This is easily done during the install, but sometimes I forget to do this. The next way that is pretty easy is to run the following in your shell prompt:

{% highlight bash %}
sudo ls /Applications/TextMate.app/Contents/Resources/mate /usr/bin/mate
{% endhighlight %}

Now you are able to open folders and files into Textmate from the terminal using these commands:

{% highlight bash %}
cd to/your/folder
mate .
{% endhighlight %}
    
or

{% highlight bash %}
cd to/your/folder
mate thefilename.txt
{% endhighlight %}
