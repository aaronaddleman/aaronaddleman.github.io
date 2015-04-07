---
layout: post
title: "Cloning your git repository from one server to another"
description: "How to move/clone your repository from one server to another and some small background information of why to use the --bare option (really its here for my note taking)."
tags: [bash, git, sysadmin]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Update - April 10, 2013

Using `rsync` is much easier if you have that option. I have not seen a down side after doing the copy 5 days ago but after copying 8 repositories over to a new server all seems to be working great. Below is a method to use if `rsync` is not available.

## The short answer

To clone your repository from one location to another the following steps can be used in your terminal prompt:

{% highlight bash %}
git clone --bare https://github.com/exampleuser/old-repo.git
# Make a bare clone of the repo

cd old-repo.git
$ git push --mirror https://newserver.com/exampleuser/new-repo.git
# Mirror-push to the new repo

cd ..
$ rm -rf old-repo.git
# Remove our temporary local repo
{% endhighlight %}
    
## The long answer

Why do we use the --bare option? According to the help text, the --bare option does not put the administrative files in <directory>/.git it puts the admin files in the <directory>. In addition, there is also no checkout of HEAD after the clone is completed.
