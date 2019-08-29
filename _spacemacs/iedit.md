---
title: iedit
category: editing
---

{: .scrollspy .section}
### Navigation of files

{: .scrollspy .section}
#### Using neotree

This is awesome way to have a visual tree of your directory structure.

To open neotree:

```
SPC f t
```

To move back to neotree:

```
SPC 0
```

{: .scrollspy .section}
### Text manipulation

{: .scrollspy .section}
#### Replacing \n

To replace a bunch of `\n` with actual newlines

* Yank a newline into the clipboard
* Issue a `:`
* Use string subtitution: `%s/\\n/`
* After the last slash in previous step, paste the clipboard of the newline
* Complete your options for replacing the \n: `/g`

{: .scrollspy .section}
#### Best way to scale the font up on a Mac

When showing your code on the big screen or to someone near your screen and they say "the text is too small", here is the best way to scale the font up:

1. Choose the change font for mac applications
1. Change the size of the font

{: .scrollspy .section}
### Development 

{: .scrollspy .section}
#### Clojurescript

To improve on Cojurescript development within Spacemacs, you need to have the following layer installed:

```
clojure
html
javascript
```
