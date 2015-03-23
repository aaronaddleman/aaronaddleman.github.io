---
layout: post
title: "Bash Arrays"
description: "In the shell, using arrays can be helpful"
tags: [linux]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Examples of bash arrays

{% highlight bash %}
array=( one two three )
files=( "/etc/passwd" "/etc/group" "/etc/hosts" )
limits=( 10, 20, 26, 39, 48)
{% endhighlight %}

## To print values

{% highlight bash %}
printf "%s\n" "${array[@]}" 
printf "%s\n" "${files[@]}" 
printf "%s\n" "${limits[@]}"
{% endhighlight %}

## Looping through the elements in the array

{% highlight bash %}
arrayOfNumbers=( one two three )
for i in "${arrayOfNumbers[@]}"
do
  echo "using $i from arrayOfNumbers"
  # do some action
done
{% endhighlight %}