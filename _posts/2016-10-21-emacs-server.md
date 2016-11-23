---
layout: post2
title: "Running an emacs server on OS X"
description: ""
tags: [emacs]
image:
  feature: https://c8.staticflickr.com/6/5717/30441913711_e73cdb6400_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---
make a file at /Library/LaunchAgents/gnu.emacs.daemon.plist with the following:

{% highlight xml %}
 <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
     <plist version="1.0">
      <dict> 
        <key>Label</key>
        <string>gnu.emacs.daemon</string>
        <key>ProgramArguments</key>
        <array>
          <string>/Applications/Emacs.app/Contents/MacOS/Emacs</string>
          <string>--daemon</string>
        </array>
       <key>RunAtLoad</key>
       <true/>
       <key>ServiceDescription</key>
       <string>Gnu Emacs Daemon</string>
       <key>UserName</key>
       <string>[YOUR USERNAME HERE]</string>
      </dict>
    </plist>
{% endhighlight %}

then run

{% highlight bash %}
    sudo launchctl load -w /Library/LaunchAgents/gnu.emacs.daemon.plist
{% endhighlight %}
