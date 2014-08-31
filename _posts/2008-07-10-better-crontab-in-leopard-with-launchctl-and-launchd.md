---
layout: post
title: "Better crontab in leopard with launchctl and launchd"
description: ""
tags: [system]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


Using the crontab is great, but there are other tools out there on Leopard that do something similar to crontab and on Leopard, its called launchd.
To create a new entry, make a new file in ~/Library/LaunchAgents/net.laptop.getmail.plist with the content of:

{% highlight xml %}
    <?xml version="1.0" encoding="UTF-8">
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
      <key>Label</key>
      <string>net.laptop.getmail</string>
      <key>UserName</key>
      <string>aaron</string>
      <key>ProgramArguments</key>
      <array>
      <string>/Users/your_user_name/bin/script.sh</string>
      </array>
      <key>StartInterval</key>
      <integer>30</integer>
      </dict>
    </plist>
{% endhighlight %}

then execute:

{% highlight bash %}
    launchctl load ~/Library/LaunchAgents/net.laptop.getmail.plist
{% endhighlight %}