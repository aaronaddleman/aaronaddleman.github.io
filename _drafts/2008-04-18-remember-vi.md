---
layout: post
title: "Remember VI"
description: ""
tags: [vi]
image:
  feature: DSC03476.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>This is really just for myself to have a reference for using the text editor named VI. Your welcome to use it yourself, perhaps I will make a PDF later to help me cheat more :P until then, on with the non-sense commands:
</p>
<h3 style="padding-left: 30px;">looking for text</h3>
<ol>
<li>when looking for text and your cursor is on the word you want to search for, use the * character to search for the pattern going forward in your document</li>
<li>setting the "incsearch" option will show the first match or the pattern while you are still typing it</li>
<li>setting the "hlseach" option will highlight all of the matches in the document when searching</li>
</ol>
<h3 style="padding-left: 30px;">moving around</h3>
<ol>
<li>use % to jump from open brace to its matching close brace or from open if statement</li>
<li>at the end of the brace or if statement, use [{ to jump back to its start of the {</li>
<li>use gd to jump from the use of a variable to its local declaration</li>
</ol>
<h3 style="padding-left: 30px;">macros and repeating</h3>
<ol>
<li>to make a macro:
<ol>
<li>type "qa" to record into register "a"</li>
<li>do all yer commands</li>
<li>type "q" to stop recording</li>
<li>to repeat the macro, enter number of times to repeat, then "@a"</li>
</ol>
</li>
<li>also, the "." will repeat any command you previously execute</li>
</ol>
