---
layout: post
title: "OS X, Mutt, and Exchange"
description: ""
tags: [shopping]
image:
  feature: 8272584751_feb76bdf1e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Install offlineimap with home brew

When installing this package you get:

{% highlight bash %}
aaron:chefzorro aaddleman$ brew install offlineimap

==> Downloading https://github.com/OfflineIMAP/offlineimap/archive/v6.5.6.tar.gz
######################################################################## 100.0%
==> Caveats
To get started, copy one of these configurations to ~/.offlineimaprc:
* minimal configuration:
    cp -n /usr/local/Cellar/offline-imap/6.5.6/offlineimap.conf.minimal ~/.offlineimaprc

* advanced configuration:
    cp -n /usr/local/Cellar/offline-imap/6.5.6/offlineimap.conf ~/.offlineimaprc

To have launchd start offline-imap at login:
    ln -sfv /usr/local/opt/offline-imap/*.plist ~/Library/LaunchAgents
Then to load offline-imap now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.offline-imap.plist
==> Summary
🍺  /usr/local/Cellar/offline-imap/6.5.6: 49 files, 640K, built in 2 seconds
{% endhighlight %}