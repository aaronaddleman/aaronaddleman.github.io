---
layout: post
title: "Blogging with Nesta"
description: "Write articles on the go or at your desktop with Nesta, Git, iOS, webdav, and Textastic."
tags: [nesta]
image:
  feature: IMG_0453.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## General

While getting used to Nesta, I found myself wanting to write more articles but I was not always in front of my repository to make changes and deploy with what ever method I had tried to use (ftp, git deploy with heroku). When I found out about the iOS text editor named "Textastic" and its ability to uae webdav I thought there must be something I can do with writing articles while on the move. After a couple of designs I came up with a solution. 
I would really like any feedback that you have about my solution as I do like making improvments.

## Solution

### the Quick


While on desktop:

1. pull down changes from remote
1. make changes
1. commit to git repo
1. deploy with capistrano

While on iOS using Textastic and webdav connection:

1. pull down changes
1. make changes
1. upload changes

### the Detailed


Let's start with the version controlled side first. First I realized that to do this I really needed my own server so I decided to go with a micro instance from Amazon Web Services. So far this has been costing me less than $4 a month. Next I created my own gitolite setup to store the entire Nesta tree structue and content. This is not necessary as you could use something like github or bitbucket for hosting your git repository, but it is helpful with deployment.
For deployment from the version controlled side I chose to use "capistrano". This allows for not only to deploy but for later on to pull down changes I make while on the go.
On the iOS side I use Textastic and a webdav connection to download changes and make edits to the content then upload via encrypted https. I like Textastic for its abilities to write and program as I use markdown, haml, and ruby with my Nesta site. Textastic allows for being able to change any area of Nesta that I would like at that moment. This is my favorite part about the system.
