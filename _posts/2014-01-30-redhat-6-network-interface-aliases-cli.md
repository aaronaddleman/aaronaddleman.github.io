---
layout: post
title: "RedHat EL 6 Network Interfaces and Aliases with CLI"
description: "When I installed RedHat EL 6 with the minimal install option, there is very little to manage the system. This is good for boot times and less packages that are unnecessary. When trying to add network aliases with files and scripts, I did not find much. Here is my contribution for how to add and manage your network interfaces, aliases, and profiles for RedHat EL 6."
tags: [sysadmin]
image:
  feature: IMG_0309.jpg
  credit: Aaron Addleman
comments: true
share: true
---


After you install RedHat EL 6 with the minimal install, you do not have much in the way of configuring options. With network interfaces, there is no way I could see to add aliases in a straight forward manner. I searched the web and did not come up with much. Below are my notes and steps on how to manage network interfaces and aliases without using the GUI.

## The Details

What follows are the necessary files that are needed for setting a interface for `eth0` and one alias for `eth0:1`.

1.  /etc/sysconfig/networking/profiles/

    Where all your profiles are kept. Each profile is a directory and is referenced in the file `/etc/sysconfig/network`

1.  /etc/sysconfig/networking/profiles/name of profile/ifcfg-eth0

    The first interface and also the parent interface file that holds the settings of the network:

{% highlight bash %}
DEVICE=eth0
HWADDR=00:00:00:00:00:00
TYPE=Ethernet
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ONBOOT=no
BOOTPROTO=dhcp
USERCTL=no
IPV6INIT=no
PEERDNS=yes
{% endhighlight %}

1.  /etc/sysconfig/networking/profiles/_foo_/ifcfg-eth0:1

{% highlight bash %}    
GATEWAY=###.###.###.###
TYPE=Ethernet
DEVICE=eth0:1
BOOTPROTO=none
NETMASK=255.255.255.###
IPADDR=###.###.###.###
USERCTL=no
IPV6INIT=no
ONPARENT=yes
PEERDNS=yes
{% endhighlight %}


1.  /etc/sysconfig/networking/network

    The `network` file holds variables for controlling the network module (for lack of better words...). Here is where you will find items like `HOSTNAME` and `CURRENT_PROFILE`

    Here is an example of what my `network` file looks like:

{% highlight bash %}
NETWORKING=yes
NETWORKING_IPV6=no
HOSTNAME=web.domain.com
CURRENT_PROFILE=production
{% endhighlight %}

1.  /etc/sysconfig/network-scripts/ifcfg-eth0

    This file is for defining the startup of the interface with the hardware mac address. Note that there is no gateway. Here is an example of what I have in my basic setup:

{% highlight bash %}
DEVICE=eth0
HWADDR=00:50:56:A8:28:0A
TYPE=Ethernet
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ONBOOT=no
BOOTPROTO=dhcp
{% endhighlight %}

1. /etc/sysconfig/network-scripts/ifcfg-eth0:1

    This is a alias of the eth0 device. Note there is also no gateway. Here is an example of what I have in my basic setup:

{% highlight bash %}
DEVICE=eth0:1
HWADDR=00:00:00:00:00:00
TYPE=Ethernet
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ONBOOT=yes
BOOTPROTO=none
IPADDR=###.###.###.###
PEERDNS=yes
{% endhighlight %}

