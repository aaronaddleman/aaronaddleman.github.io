---
layout: post
title: "Openstack with Vagrant, VirtualBox, and Chef"
description: "Installing Openstack with Vagrant, VirtualBox, and Chef"
tags: [openstack, chef]
image:
  feature: 8160262732_04666c38b1_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Restart openstack

for svc in api cert compute conductor network scheduler; do
  service openstack-nova-$svc restart
done

