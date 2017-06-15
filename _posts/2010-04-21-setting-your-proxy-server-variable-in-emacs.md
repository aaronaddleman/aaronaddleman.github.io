---
layout: post
title: "Setting your proxy server variable in Emacs"
description: ""
tags: [emacs]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Running your Emacs behind a proxy server

```
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "proxy.com:8080")
     ("https" . "proxy.com:8080")))

(setq url-http-proxy-basic-auth-storage
    (list (list "proxy.com:8080"
                (cons "Input your LDAP UID !"
                      (base64-encode-string "LOGIN:PASSWORD")))))
```

Source: https://stackoverflow.com/questions/10787087/use-elpa-emacs-behind-a-proxy-requiring-authentication/18697223#18697223
