---
layout: post
title: "Removing wp-admin directory"
description: "Running Wordpress with no wp-admin directory to improve security on an production environment server while other environments have the admin files necessary for management of content."
tags: [wordpress, sysadmin]
image:
  feature: 8160155219_edf33c3485_o_p.jpeg
  credit: Aaron Addleman
comments: true
share: true
---

While having the wp-admin directory is helpful, on a production environment there is no need to have these files available by the web server. So I started to move the files out. 

## What happened first

When I moved the folder wp-admin out of the Wordpress folder the entire site went blank. Not a good start.

## The './wp-admin/includes' folder

While looking around the wp-admin directory I noticed the 'includes' folder. So I made a folder structure of './wp-admin/includes/' and I moved all of the files that were in the includes directory back into the proper place. When I refreshed the site, it came back!

## Now, what files do you need?

After moving the files out of the includes directory, I was able to find 4 key files that seemed to be required.

* class-wp-list-table.php
* class-wp-media-list-table.php
* class-wp-ms-sites-list-table.php
* class-wp-ms-themes-list-table.php
