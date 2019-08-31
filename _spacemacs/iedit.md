---
title: Editing 
category: editing
---

{: .scrollspy .section}
#### Replacing newline

To replace a bunch of `\n` with actual newlines

* Yank a newline into the clipboard
* Issue a `:`
* Use string subtitution: `%s/\\n/`
* After the last slash in previous step, paste the clipboard of the newline
* Complete your options for replacing the \n: `/g`

{: .scrollspy .section}
#### Scaling Fonts

When showing your code on the big screen or to someone near your screen and they say "the text is too small", here is the best way to scale the font up:

1. Choose the change font for mac applications
1. Change the size of the font
