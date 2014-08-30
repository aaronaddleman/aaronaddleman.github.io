---
layout: post
title: "VMWare Fusion 4/5 static ip address"
description: ""
tags: [sysadmin]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


To force the guest to have a static ip address, edit the following file below and add in the example of code:

    # file
    sudo vi /Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf
    # example host
    host vm-numberone {
    hardware ethernet 00:0C:29:0B:7E:07;
    fixed-address  172.16.139.144;
    }

Once saved, quit VMware Fusion and relaunch. After you refresh your dhcp lease the guest vmware should grab its static ip address.
