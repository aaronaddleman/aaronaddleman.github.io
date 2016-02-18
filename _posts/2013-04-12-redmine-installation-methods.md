---
layout: post
title: "Installing Redmine with various methods"
description: "While there are some default instructions on how to install Redmine, I needed a document to list some of the methods available besides the default."
tags: [redmine, sysadmin]
image:
  feature: 9254164644_95b5f43b18_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## The root directory method

Allowing your redmine instance to take over the entire domain! Here are the steps you will need to continue with this task:



1. Make your apps directory where your various redmine versions will be stored

{% highlight bash %}
mkdir /apps
{% endhighlight %}

1. Uncompress redmine into the apps directory

{% highlight bash %}
tar zxvf redmine.tar.gz
{% endhighlight %}

1. Install dependencies

{% highlight bash %}
cd /apps/redmine
bundle install
{% endhighlight %}

1. Create a symlink in /var/www that points to the redmine public directory

{% highlight bash %}
cd /apps
ln -s /apps/redmine/public /var/www/redmine
{% endhighlight %}

1. Create a virtual host with the following basic config:

{% highlight plain %}
<VirtualHost *:80>
  ServerName red.example.com
  DocumentRoot /var/www/
  <Directory />
    Options FollowSymLinks
    Allowoverride None
    RailsBaseURI /redmine-2.3.0
    PassengerResolveSymlinksInDocumentRoot on

    ### (optional) redirect to https
    #RewriteEngine On
  	#RewriteCond %{HTTPS} off
    
    ### exception for the email handler to not rewrite to https
    #RewriteCond %{REMOTE_ADDR} !###\.###\.###\.###
    #RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
  </Directory>


  ErrorLog ${APACHE_LOG_DIR}/red.example.org-error.log

  # Possible values include: debug, info, notice, warn, error, crit,
  # alert, emerg.
  LogLevel warn
  CustomLog ${APACHE_LOG_DIR}/redmine.example.org-access.log combined
</VirtualHost>
{% endhighlight %}


## The sub-directory method

When you want to have your Redmine application be hosted under a custom directory and not in the root of your entire domain, use the instructions be below to get started.

### Steps to the sub-directory

{% highlight plain %}
<VirtualHost *:80>
  ServerName red.example.com
  DocumentRoot /var/www/
  <Directory />
    Allow from all
  </Directory>
			
  RailsBaseURI /redmine
  <Directory /var/www/redmine>
    Options -MultiViews
  </Directory>

  ErrorLog ${APACHE_LOG_DIR}/redmine.example.org-error.log

  # Possible values include: debug, info, notice, warn, error, crit,
  # alert, emerg.
  LogLevel warn
  CustomLog ${APACHE_LOG_DIR}/redmine.example.org-access.log combined
</VirtualHost>
{% endhighlight %}




## After configuring the website, continue to configure redmine with these steps

1. Modify your /etc/hosts file to access the newly created site

{% highlight bash %}
echo "127.0.0.1 redmine redmine.example.com" >> /etc/hosts
{% endhighlight %}

1. Copy and edit config/database.yml to your needs

1. Run database migrations

{% highlight bash %}
rake db:migrate
{% endhighlight %}

1. Generate secret token

{% highlight bash %}
rake generate_secret_token
{% endhighlight %}

1. Start up apache and login!

{% highlight bash %}
username: admin
password: admin
{% endhighlight %}

