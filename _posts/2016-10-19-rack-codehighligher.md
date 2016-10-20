---
layout: post2
title: "Rack code highlight for Nesta"
description: "Steps for setting up the rack code highlighter for Nesta"
tags: [programming]
image:
  feature: https://c5.staticflickr.com/9/8792/16875519420_9c469d9ee6_z.jpg
  credit: Aaron Addleman
comments: true
share: true
toc: true
---

## What

If your running the Nesta web framework and you want to highlight your code, these are the steps I found (albiet a long time ago and things might have changed since then) to configure the code highlighting. 

## Why

Who doesnt like pretty colors for looking at code, because it sure does help me find errors. So, why not display them on your web page too? Easy for people to read and consume while browsing your site. I know this seems pretty obvious, but what the heck, I will just keep typing.

## How

On your terminal, type the following out:

{% highlight bash %}
# this command for os x
sudo port -vvv install oniguruma4

# this command for debian
sudo apt-get -y install libonig-dev

# add the following to your config.ru file before run Nesta::App
echo "use Rack::Codehighlighter, :ultraviolet, :element => \"pre>code\", :markdown => true, :theme => \"eiffel\"" >> config.ru
echo "run Nesta::App" >> config.ru

gem install ultraviolet
gem install rspec-core -v='2.11.1'
gem install rspec-expectations -v='2.11.2'
gem install rspec-mocks -v='2.11.2'
gem install rspec -v='2.11.0'
{% endhighlight %}
