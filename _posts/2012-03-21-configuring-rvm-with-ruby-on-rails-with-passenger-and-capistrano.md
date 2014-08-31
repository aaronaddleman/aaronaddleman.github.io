---
layout: post
title: "Configuring rvm with ruby on rails with passenger and capistrano"
description: ""
tags: [ruby, programming]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


<p>This covers using the following software versions:
</p>
<ul>
<li>ruby-1.9.2-p318</li>
<li>passenger-3.0.11</li>
<li>rails 3.2.2</li>
<li>Apache 2.2</li>
</ul>
In short, the following steps are necessary:
<ol>
<li>Install RVM with the multi user instructions</li>
<li>Check requirements
<pre>rvm requirements</pre>
</li>
<li>Install ruby 1.9.2
<pre>rvm install 1.9.2</pre>
</li>
<li>Install passenger
<pre>gem install passenger</pre>
</li>
<li>Load passenger into apache with&nbsp;<a href="/assets/files/passenger.conf_.txt">passenger.conf</a>
</li>
<li>Add a new user called 'cap-deploy'</li>
<li>Create a dir of /webapps and owned by the user and group of the apache process</li>
<li>Create a dir of /webapps/yourrailsapp and the user and group of cap-deploy with perms of 775 (might be able to get away with less perms)</li>
<li>Cap your rails application on your dev environment</li>
<li>Add your rails app to a version management (I went with github) that is accessible by your hosting server</li>
<li>Configure your version management to ignore the following files <a href="/assets/files/gitignore.txt">gitignore</a>
</li>
<li>Add the following to your Cap file:&nbsp;<a href="/assets/files/Capfile.txt">Capfile</a>
</li>
<li>Configure your /config/deploy.rb file with db support so that version control system does not share our db config:&nbsp;<a href="/assets/files/deploy.rb_.txt">deploy.rb</a>
</li>
<li>Run the cap and have fun!</li>
<li>cap deploy:setup</li>
<li>do first push</li>
<li>cap deploy:cold</li>
<li>do updates</li>
<li>cap deploy</li>
</ol>
