---
layout: post
title: "Setting font size in MacVim or graphical vim"
description: ""
tags: [vi]
image:
  feature: IMG_0612.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>My graphical vim launched with a really tiny font size.&nbsp;Actually&nbsp;it was size 11. To set it higher, I used the following command:
<code> :set guifont=*</code>
This brought up my native font selector and I choose a new font and size to fit my desired style. But now I wanted this to be set every time I launched vim. So I typed:
<code> :set guifont</code>
and I got back the value of "guifont=Menlo Regular:h14". To set this style in my .gvimrc file I added the following line:
<code> set guifont=Menlo\ Regular:h14"</code>
And now I have a size 14 font set every time I open the editor. Awesome!</p>
