---
layout: post
title: "VMWare Fusion and the HGFS permissions"
description: "Mount your /mnt/hgfs directory with the permissions of your choosing."
tags: [sysadmin]
image:
  feature: IMG_0637.jpg
  credit: Aaron Addleman
comments: true
share: true
---

While working with VMware Fusion on my Mac I noticed a problem with the permissions. In summary (rest of my notes are below) I modified the start script of the vmware tools to mount the `hgfs` directory with the permissions I wanted for my project.

    {% highlight bash %}
    # Mount all hgfs filesystems
    vmware_mount_vmhgfs() {
      if [ "`is_vmhgfs_mounted`" = "no" ]; then
        #OLD vmware_exec_selinux "mount -t vmhgfs .host:/ $vmhgfs_mnt"
        vmware_exec_selinux "mount -o uid=48,gid=48 -t vmhgfs .host:/ $vmhgfs_mnt"
      fi
    }
    {% endhighlight %}

Might be a good idea to have these numbers be the same as my Mac operating system.
