---
layout: post
title: "Automatic tab indentation when Ruby mode is active"
description: ""
tags: [vi]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>When creating a file in emacs C-x C-f and typing in a filename (for example, abc.rb) the Ruby mode is activated. In this mode, there is one nice feature that has been included (Might be in others as well. I am still a noob.) is automatic tab indentations. Here is an example:
</p>
<ol>
<li>Type the beginning of the file "Class Animal"</li>
<li>Insert 2 returns</li>
<li>At this point hitting tab will not do anything</li>
<li>Type "def name"</li>
<li>hit enter</li>
<li>Now hit tab once and you should notice that it indents 2 space characters</li>
</ol>
After playing with this a couple of minutes, I also noticed a better way to code. I no longer have to hit tab to start programming! I just start to program my line, and hit tab at the end, and emacs takes care of the rest. I shall illustrate below:
<ol>
<li>While inside a "def" block</li>
<li>without hitting tab, type a line of text, and do not hit enter when you are done</li>
<li>hit the tab button</li>
<li>you should notice your code line will be indented where it needs to be</li>
</ol>
The tab button only needs to be hit once to align correctly. I have to guess that this is not completely perfect as most things like this feature have some flaw, but for now, I am a happy EMacs camper.
I am sure that automatic tabbing is not limited to only the Ruby mode. But its the first file type that arrives in my mind when testing out stuff because I am a rubyist at heart.
