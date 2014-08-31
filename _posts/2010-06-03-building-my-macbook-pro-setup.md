---
layout: post
title: "MacBook Pro Build"
description: ""
tags: [howto]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


## First, back it up
To backup data, here are some options:

## ditto

{% highlight bash %}
    ditto -v -V -X src [ ... src ] dst
{% endhighlight %}

## cccloner

Works pretty good.

# Software

Below is my list of software and configurations needed for building my very comfy mac book pro:

* Always install Developer Tools!
* Google Chrome
* Google Chrome Extentions
 * [Chrome Bird][]
 * [Chrome Sniffer][]
 * [Delicious][]
 * [Dictionary][]
 * [Google Voice][]
 * [MeasureIt][]
 * [Picnik][]
 * [Validity][]
* [Alfred][]
* [Apache Directory Studio][]
* [AppCleaner][]
* [Coda][]
* [Cyberduck][]
* [Disk Inventory X][]
* [Divvy][]
* [DropBox][]
* [Emacs][]
* [Espresso][]
* [FitBit][]
* [Growl][]
* [HandBrake][]
* [MacPorts][]
* [MacVim][]
* [Mamp PRO][]
* [MySql Workbench][]
* [OmniFocus][]
* [Remote Desktop Connection][]
* [SomaFM][]
* [SourceTree][]
* [Sublime 2][]
* [TextMate][]
* [Transmit][]
* [VLC][]
* [VMware Fusion][]

# Complies and Configurations

## MacPorts

After extracting the source file:

{% highlight bash %}
    ./configure
    ./make
    ./make install
{% endhighlight %}

edit ~/.profile and put in some help

{% highlight bash %}
    vi ~/.profile
    export set PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    export set MANPATH="/opt/local/share/man:$MANPATH"
    export set DISPLAY=:0.0
{% endhighlight %}


[Alfred]: http://www.alfredapp.com/ "Alfred App"
[Apache Directory Studio]: http://directory.apache.org/studio/ "Apache Directory Studio"
[AppCleaner]: http://www.freemacsoft.net/appcleaner/ "AppCleaner"
[Chrome Bird]: https://chrome.google.com/extensions/detail/encaiiljifbdbjlphpgpiimidegddhic "Chrome Extension: Chrome Bird"
[Chrome Sniffer]: https://chrome.google.com/extensions/detail/homgcnaoacgigpkkljjjekpignblkeae "Chrome Extension: Sniffer"
[Coda]: http://panic.com/coda/ "Coda"
[Cyberduck]: http://cyberduck.ch/ "Cyberduck"
[Delicious]: https://chrome.google.com/extensions/detail/lnejbeiilmbliffhdepeobjemekgdnok  "Chrome Extension: Delicious"
[Dictionary]: https://chrome.google.com/extensions/detail/mgijmajocgfcbeboacabfgobmjgjcoja "Chrome Extension: Dictionary"
[Disk Inventory X]: http://www.derlien.com/ "Disk Inventory X"
[Divvy]: http://mizage.com/divvy/ "Divvy"
[DropBox]: https://www.dropbox.com/ "DropBox"
[Emacs]: http://emacsformacosx.com/ "Emacs"
[Espresso]: http://macrabbit.com/espresso/ "Espresso"
[FitBit]: http://www.fitbit.com/ "FitBit"
[Google Voice]: https://chrome.google.com/extensions/detail/kcnhkahnjcbndmmehfkdnkjomaanaooo "Chrome Extension: Google Voice"
[Growl]: http://growl.info/ "Growl"
[HandBrake]: http://handbrake.fr/ "HandBrake"
[MacPorts]: http://www.macports.org/ "MacPorts"
[MacVim]: http://code.google.com/p/macvim/ "MacVim"
[Mamp PRO]: http://www.mamp.info/en/mamp-pro/index.html "Mamp Pro"
[MeasureIt]: https://chrome.google.com/extensions/detail/hcifofgaphfkfdcjbdogpamghiihilkl "Chrome Extension: MeasureIt"
[MySql Workbench]: http://www.mysql.com/products/workbench/ "MySQL Workbench"
[OmniFocus]: http://www.omnigroup.com/products/omnifocus/ "OmniFocus"
[Picnik]: https://chrome.google.com/extensions/detail/hcifofgaphfkfdcjbdogpamghiihilkl "Chrome Extension: Picnik"
[Remote Desktop Connection]: http://www.microsoft.com/mac/downloads.mspx?pid=Mactopia_RDC&amp;fid=CD9EC77E-5B07-4332-849F-046611458871#viewer "Remote Desktop Connection"
[SomaFM]: https://itunes.apple.com/us/app/somafm-radio-player/id449155338?mt=12 "SomaFM"
[SourceTree]: http://www.sourcetreeapp.com/ "SourceTree"
[Sublime 2]: http://www.sublimetext.com/2 "Sublime 2"
[TextMate]: http://macromates.com/ "TextMate"
[Transmit]: http://panic.com/transmit/ "Transmit"
[VLC]: http://www.videolan.org/vlc/index.html "VLC"
[VMware Fusion]: http://www.vmware.com/products/fusion/overview.html "VMware Fusion"
[Validity]: https://chrome.google.com/extensions/detail/bbicmjjbohdfglopkidebfccilipgeif "Chrome Extension: Validity"
