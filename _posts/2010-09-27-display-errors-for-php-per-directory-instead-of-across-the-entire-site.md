---
layout: post
title: "Display errors for PHP per directory instead of across the entire site"
description: ""
tags: [system]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


For debugging php code, its often nice to have the errors printed for you on a specific directory that might be your development area, but leave you production area free of error codes.
To turn on errors for a specific directory, I tried the following and it worked out quite well:

{% highlight plain %}
    <directory>
    php_flag display_errors 1
    </directory>
{% endhighlight %}

You also have the option of putting the <strong>php_flag display_errors 1 </strong>in a .htaccess file if you do not have access to the Apache configuration files (assuming your hosting service reads the .htaccess file).
