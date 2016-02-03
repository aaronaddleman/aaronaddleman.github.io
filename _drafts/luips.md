---
layout: post
title: "Building and installing Lupis with OpenResty"
description: "Running OpenResty and making applications with Lupis"
tags: [programming]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Installing and using Lupis framework

# Ubunt 15

## install openresty 1.9.7.3

{% highlight bash %}
sudo apt-get install libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential perl make libssl-dev \
    postgresql-9.4 postgresql-server-dev-9.4 postgresql-contrib-9.4
    
./configure --with-cc-opt="-I/usr/include/openssl -I/usr/include" \ 
--with-ld-opt="-L/usr/include/openssl -L/usr/include" -j8 \ 
--prefix=/opt/openresty-1.9.7.3 \
--with-pcre-jit \
--with-ipv6 \
--with-http_postgres_module

# make with 4 spare cpu power
make -j4
# install
make install
{% endhighlight %}

# test it out!

{% highlight %}
mkdir ~/work
cd ~/work
mkdir logs/ conf/
{% endhighlight %}

{% highlight text %}
# contents of ~/conf/nginx.conf
worker_processes  1;
error_log logs/error.log;
events {
    worker_connections 1024;
}
http {
    server {
        listen 8080;
        location / {
            default_type text/html;
            content_by_lua '
                ngx.say("<p>hello, world</p>")
            ';
        }
    }
}
{% endhighlight %}

{% highlight bash %}
PATH=/opt/openresty-1.9.7.3/nginx/sbin:$PATH
export PATH
nginx -p `pwd`/ -c conf/nginx.conf
{% endhighlight %}

test the app with curl!

{% highlight bash %}
curl http://localhost:8080/
{% endhighlight %}

the expected output should be:

{% highlight html %}
<p>hello, world</p>
{% endhighlight %}
