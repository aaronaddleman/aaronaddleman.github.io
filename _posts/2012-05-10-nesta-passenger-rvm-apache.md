---
layout: post
title: "Nestacms with passenger, rvm, apache"
description: "The steps that I took for setting up the Nestacms with passenger, RVM, and Apache on a hosting server."
tags: [bash, sysadmin]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Objective

To get Nesta to be served from Apache with Passenger.

## Summary

About a couple months ago, I came across Nesta which is really awesome and really simple CMS built off the Sinatra framework. But I could not figure out how to host the application with Apache. Fast forward to this evening and I finally found a solution. If you have any suggestions on how it could be done different, please post a comment as I would like to hear about it.

## Build

So! you want to build it. Ok, here are the steps I did:

 1. Install RVM and Ruby (I ended up with the single user install as you will notice)
 1. curl -L get.rvm.io | bash -s stable
 1. rvm requirements
 1. (install necessary stuff to compile ruby and gems)
 1. rvm install 1.9.2
 1. rvm use –default 1.9.2
 1. Install Nesta
 1. gem install nesta
 1. Create your site home and site itself
 1. mkdir /apps
 1. cd /apps
 1. nesta new mysite
 1. (take note that all additional steps use “/apps/mysite” as the nesta directory)
 1. Install Passenger
 1. gem install passenger
 1. passenger-install-apache2-module
 1. Apache config
 1. mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled /etc/httpd/mods-available /etc/httpd/mods-enabled
 1. Create the file /etc/httpd/mods-available/passenger.conf (see git gist below)
 1. Create the file /etc/httpd/sites-available/mysite (see git gist below)
 1. cd /etc/httpd/sites-enabled
 1. ln -s ../sites-available/mysite mysite
 1. cd /etc/httpd/mods-enabled
 1. ln -s ../mods-available/passenger.conf passenger.conf
 1. turn on NameVirtualHosts feature
 1. sudo /etc/init.d/httpd restart
 1. goto your new site!
 1. SetEnv LD_LIBRARY_PATH /home/aaron/.rvm/rubies/ruby-1.9.2-p320/lib
 1. SetEnv GEM_PATH /home/aaron/.rvm/gems/ruby-1.9.2-p320:/home/aaron/.rvm/gems/ruby-1.9.2-p320@global

Next, put the following into your Apache configuration:

    {% highlight apache %}
    LoadModule passenger_module /home/aaron/.rvm/gems/ruby-1.9.2-p320/gems/passenger-3.0.12/ext/apache2/mod_passenger.so
    PassengerRoot /home/aaron/.rvm/gems/ruby-1.9.2-p320/gems/passenger-3.0.12
    PassengerRuby /home/aaron/.rvm/rubies/ruby-1.9.2-p320/bin/ruby
  
    <VirtualHost *:80>
      ServerName centos
      # !!! Be sure to point DocumentRoot to "public"
      DocumentRoot /apps/mysite/public
    
      <Directory /apps/mysite/public>
        # This relaxes Apache security settings.
        AllowOverride all
        # MultiViews must be turned off.
        Options -Multiviews
      </Directory>
    </VirturalHost>
    {% endhighlight %}