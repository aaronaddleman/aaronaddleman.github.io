---
layout: post
title: "OpenLDAP and ppolicy"
description: "How to integrate OpenLDAP with ppolicy and management with Apache Directory Studio"
tags: [openldap]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

After installing OpenLDAP and having Apache2 authenticate to OpenLDAP, it was time to bring in password policy. First up is getting the slapd.conf file to be like the following:
