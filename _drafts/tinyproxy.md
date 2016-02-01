# Tiny Proxy

<% hightlight bash %>
11:45:07  ~ # brew install tinyproxy
==> Downloading https://homebrew.bintray.com/bottles/tinyproxy-1.8.3.yosemite.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring tinyproxy-1.8.3.yosemite.bottle.1.tar.gz
==> Caveats
To have launchd start tinyproxy at login:
  ln -sfv /usr/local/opt/tinyproxy/*.plist ~/Library/LaunchAgents
Then to load tinyproxy now:
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.tinyproxy.plist
Or, if you don't want/need launchctl, you can just run:
  tinyproxy
==> Summary
🍺  /usr/local/Cellar/tinyproxy/1.8.3: 14 files, 236K
11:45:24  ~ #
<% endhighlight %>

# Configuring

## Mac OS X from homebrew
/usr/local/opt/tinyproxy
/usr/local/etc/tinxyproxy.conf
