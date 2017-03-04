---
layout: post2
title: "Archiving images"
description: "How I backup my images to my mass storage with a workflow and exiftool."
tags: [sysadmin]
image:
  feature: https://c1.staticflickr.com/3/2829/33121491481_dfef182dc0_z.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What ##

Taking many photos results in tons of files and information. How do we manage all of these files? With Adobe? No, I can't afford Adobe. With Photos (from Apple)? No, Photos moves my files into a subdirectory structure and not easy to manage on an external storage device on the cheap.

What about using the Image Capture program sending the files directly to disk? Even better! Let us make a work-flow that we can choose from the drop down menu of the destination list.

## Why ##

Reasons for using this method are:

1. it is very cheap
1. works with the current hardware I have now
1. results in files organized by `yyyy/mm/dd/yyyymmdd-hh-mm-ss.ext`
1. does not write over existing files

## How ##

Open the `Automator` program and choose `Image Capture Plugin`. Locate the item in the Library called `Run Shell Script`. Create a script that will process each image. I used the following:

{% highlight shell %}
for f in "$@"
do
    if [ -d /Volumes/drobo1 ]
    then
        echo "processing $f" >> /tmp/p1.txt
		/Users/aaddleman/processImage.sh $f
    fi
done
{% endhighlight %}

The above script says the following:

> Go through all the files in $@
> Every time I see an image, assign to the variable f
> If the directory /Volumes/drobo1 exist
> echo the string "processing $f" and append to /tmp/p1.txt
> execute the script /Users/aaddleman/processImage.sh and pass in the $f file

Here is the processImage.sh script:

{% highlight shell %}
#!/usr/bin/env bash

set -x 

/usr/local/bin/exiftool -P -v2 "-FileName<FileModifyDate" \
-d /Volumes/drobo1/media_org/%Y/%m/%d/%Y%m%d-%H%M%S%%-c.%%e ${1} >> /tmp/processImage.log
{% endhighlight %}

## The workflow ##

<div class="container">
<div class="row">
<div class="col s12">
<span>
  {% include_relative 2017-03-04-image_archiver.svg %}
</span>
</div>
</div>
</div>
