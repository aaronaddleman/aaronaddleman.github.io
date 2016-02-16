---
layout: post
title: "SSH bug in 10.5.5 aka xmalloc problem"
description: ""
tags: [uncategorized]
image:
  feature: 11786474283_9f0f30e96c_o_m.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


After updating my OSX system to 10.5.5 I found a problem with ssh that does not always appear:

{% highlight bash %}
    macbook:~ root$ /usr/bin/ssh username@host.domain.com
    xmalloc: zero size
{% endhighlight %}

So this error is basically from ssh being compiled incorrectlly by Apple and the ssh program is asking for a memory object that is not available. 

## So how do I fix this?

Thats a good question. The easiest way to fix this problem is to install your own version of ssh on another location. This is easy to accomplish with <a href="http://www.macports.org/">MacPorts</a>

## I dont want to read all that stuff! Just tell me how to do it!

Okay Okay, I will tell you how to do it, but you gotta choose between two options, Source or Package.

## Whats the difference between Package and Source?

### Source

When installing from source, you will need the Developers Tools installed (you can get this from the Leopard disc) and you will have a high chance of success when following the steps below.

### Package

When installing from the Package, its very straight forward and just like installing an application that uses the installer program. However, I have not had much success.</p>

## Okay, I want to install from Source. How do I do it?

You will need the following things:

* Developer Tools installed (in specific, the gcc compiler)
* <a href="http://www.macports.org/install.php#source">MacPorts source download</a>ed to your computer

## Instructions

Now here are the instructions (warning, this will use cmd line and root account. I take no responsibility if you have a problem):


1. Extract the macports to a directory.
1. The directory you choose is up to you. From here on I will refer to that directory as $MacPortSource
1. Open up to the terminal.
1. use "cd" command to goto the $MacPortSource (this can be accomplished by typing "c" then "d" then space then drag the folder of your $MacPortSource onto the terminal, then hit enter)
1. now build the macport application
1. type "make"
1. tons of text will fly by, this is okay
1. after text is done flying by
1. type "sudo make install" then hit enter
1. this will ask for your password. type it. then hit enter
1. you should now have a new command /opt/local/bin/port
1. now lets install ssh
1. type "sudo /opt/local/bin/port -v install openssh"
1. if it asks for your password again, type it. then hit enter
1. text will fly by
1. when its done, it will be installed to /opt/local/bin/ssh
1. lets test it out!
1. use /opt/local/bin/ssh username@hostname.domain.org
1. if all is good, lets subsitute the /usr/bin/ssh with the /opt/local/bin/ssh by going to the next section

## It's working!!

WAhooIOOoooo!!! My ssh is working! Now how do I use it with out typing /opt/local/bin stuff? Edit your ~/.profile file in your home directory and put in the following line:

{% highlight bash %}
    PATH="$PATH:/opt/local/bin"
{% endhighlight %}
    
then run the following command on your command prompt to load the change:

{% highlight bash %}
    source ~/.profile
{% endhighlight %}

## Other applications

Okay! Thats Awesome!! now, what about my other applications? What you want to do is make a soft link between /usr/bin/ssh and /opt/local/bin/ssh by using the following steps as root:

{% highlight bash %}
    sudo su
    # (type in password)
    mv /usr/bin/ssh /usr/bin/ssh.macosx
    ln -s /opt/local/bin/ssh /usr/bin/ssh
{% endhighlight %}

This moves (or renames) the broken ssh binary to ssh.macosx and then the last step creates a soft link (thats the -s part) in /usr/bin/ that points to /opt/local/bin/ssh.
YAYAYA now my sftp works in Transmit!
