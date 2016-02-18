---
layout: post
title: "building passenger with macports in os x leopard and hosting with apache and create an alias with railsbaseuri"
description: ""
tags: [system, howto]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Installing Passenger should be very easy. Please try following my steps below and you should get some good success. I built and used the following configuration with Mac OSX 10.6. But I am sure changes in the OS/Passenger/Ruby will change in the future. You will need to have the following for this article:

* MacPorts installed
* No fear of using the terminal

Below are the steps necessary to do everything, after that is a list of commands I used that follow the steps:

* Install the Passenger gem
* Install the Apache2 with MacPorts
* Set variable APXS for building passenger module
* Run build and install for Passenger module for Apache 2
* Edit Apache Conf file

Here is what I typed in (I have also attached <a href="/assets/files/passenger_apache_railsbaseuri.txt">Instructions on how to install Passenger and host Ruby on Rails with either Virtualhost or RailsBaseURI</a> for downloading):</span>

{% highlight bash %}
    gem install passenger
    port install apache2
    export APXS=/opt/local/apache2/bin/apxs
    passenger-install-apache2-module
{% endhighlight %}

edit your apache conf file to add the following lines

{% highlight plain %}
    LoadModule passenger_module /opt/local/lib/ruby/gems/1.8/gems/passenger-2.0.6/ext/apache2/mod_passenger.so
    PassengerRoot /opt/local/lib/ruby/gems/1.8/gems/passenger-2.0.6
    PassengerRuby /opt/local/bin/ruby
{% endhighlight %}

## Host your Rails app

To host your rails app with either a virtual host or Alias method with RailsBaseURI /path/to/app/dir

### Virtual host method

{% highlight plain %}
    # Virtual host method
    <VirtualHost *:80>
      ServerName www.yourhost.com
      DocumentRoot /somewhere/public
    </VirtualHost>
{% endhighlight %}

### Alias method

{% highlight bash %}
    cd /somewhere/already
    ln -s /rails_app/public /new_app
{% endhighlight %}

text to put in your apache conf

{% highlight plain %}
    <VirtualHost *:80>
      ServerName www.yourhost.com
      DocumentRoot /somewhere/already
      RailsBaseURI /new_app
    </VirtualHost>
{% endhighlight %}
