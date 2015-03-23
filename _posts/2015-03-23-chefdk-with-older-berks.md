---
layout: post
title: "Using ChefDK and running with older berks"
description: "Using ChefDK with a cookbook that has older version of Berksfile (usually 2.x)"
tags: [chef]
image:
  feature: IMG_0566.JPG
  credit: Aaron Addleman
comments: true
share: true
---

## What

Installing ChefDK and allowing it to use Berksfile in version 2.x format. This also helps resolving the nokogiri issue for installing 1.6.6.2 .

## Why

Using ChefDK to create and or manage existing cookbooks. When installing the software it has its own embedded ruby environment with its necessary version of berkshelf. When you want to use an older version of berks along side ChefDK you sometimes get an error with nokogiri. This post helps resolve that error.

## How

After installing ChefDK, goto your cookbook with the Gem file and Berksfile that says something to the order of:

{% highlight ruby %}
# ./Gemfile
source 'https://rubygems.org'
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

gem 'berkshelf', '~> 2.0.0'

# ./Berksfile
chef_api :config
metadata

{% endhighlight %}

You need to get your own berks installed to your home directories berks path:


### For RedHat Linux


{% highlight bash %}
yum install libxml2-devel
bundle config build.nokogiri "--use-system-libraries=true --with-xml2-include=/usr/include/libxml2/"
bundle install
{% endhighlight %}

If for some reason this does not work, run the following:

{% highlight bash %}
gem install nokogiri -v '1.6.6.2' -- "--use-system-libraries=true --with-xml2-include=/usr/include/libxml2/"
bundle install
{% endhighlight %}

### For Mac OS X

{% highlight bash %}
brew install libxml2
bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"
bundle install
{% endhighlight %}