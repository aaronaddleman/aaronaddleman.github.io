---
layout: post
title: "redhat 5 server notes and rants"
description: ""
tags: [system]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


So before you get into reading this article, I have to say this is going to be all technical. This area is for me to use as a reminder to find info easier than thumbing through a thick redhat book...

## Partitions

### for webserver

* 02gb swap
* 05gb /
* 20gb /home
* 10gb /usr
* 30gb /opt
* 40gb /var/www
* 10gb /var/video
* 40gb /var

## turning on the network interfaces at boot up

* edit the /etc/sysconfig/network file and make sure you have NETWORKING=yes and your HOSTNAME=yourhostname
* edit the /etc/hosts file and make entries for localhost.localdomain localhost and other hosts needed
* edit the /etc/resolv.conf file and put in the dns servers
* edit the /etc/sysconfig/network-scripts/ifcfg-XXXX and put in:

ifcfg:

{% highlight bash %}
    DEVICE=XXXX
    BOOTPROTO=dhcp
    ONBOOT=yes
{% endhighlight %}

or for static

{% highlight bash %}
    DEVICE=XXXX
    BOOTPROTO=none
    ONBOOT=yes
    NETWORK=###.###.###.###
    NETMASK=###.###.###.###
    IPADDR=###.###.###.###
    USERCTL=NO
{% endhighlight %}

<strong>controlling services when they start/stop</strong>
to make a list of services when they start/stop in the init runlevels:
<blockquote>chkconfig --list</blockquote>
to list only one service
<blockquote>chkconfig --list &lt;service name&gt;</blockquote>
to change when a service is started or stopped at init levels
<blockquote>chkconfig --level &lt;levels&gt; &lt;service name&gt; [on|off|reset]</blockquote>
to use a text based manager for the current level
<blockquote>ntsysv</blockquote>
to use a text based manager for multiple levels
<blockquote>ntsysv --levels &lt;levels&gt;</blockquote>
<strong>enabling quotas</strong>
<ol>
<li>edit the fstab table and mark the selected partitions with ro,acl,acl,usrquota,grpquota
<li>restart the server
<li>run quotacheck -uvg &lt;device name&gt; to build files for first time
</ol>
<strong>package managment</strong>
to register the rhn package management:
<blockquote>rhn_register (as root)</blockquote>
before installing packages, make sure you get your GPG key! its found on the root directory of your cd/dvd disk and installed with the following:
<blockquote>rpm --import &lt;key file&gt;</blockquote>
to verify the key has been installed:
<blockquote>rpm -qa gpg-pubkey*</blockquote>
to view the details of the key:
<blockquote>rpm -qi &lt;key's name&gt;</blockquote>
to list available packages for installing with yum:
<blockquote>yum list available</blockquote>
to list dependancies:
<blockquote>yum deplist &lt;package name&gt;</blockquote>
to show updates that should be applied:
<blockquote>yum list updates</blockquote>
to apply all updates from the command above:
<blockquote>yum update</blockquote>
to apply an update to a list of packages:
<blockquote>yum update &lt;package name&gt; &lt;package name&gt;</blockquote>
<strong>system boot process</strong>
to change the system run levels in command line:
<blockquote>ntsysv --level &lt;levels&gt;</blockquote>
