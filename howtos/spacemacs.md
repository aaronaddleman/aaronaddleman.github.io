---
layout: howtos
title: Spacemacs
icon_svg_url: https://upload.wikimedia.org/wikipedia/commons/1/1c/Spacemacs_logo.svg
description: |
  An editor with a twist on the conflict between Emacs and Vim, and my notes about how to make it useful.
---

WARNING: This document is only for EVIL based users. Not control tower.

## Navigation of files

### Using neotree

This is awesome way to have a visual tree of your directory structure.

To open neotree:

```
SPC f t
```

To move back to neotree:

```
SPC 0
```
## Text manipulation

### iedit (multi cursor editing)

1. Select a pattern of text `v` or `SHIFT v`
1. Enable iEdit `SPC s e`
1. The following shortcuts are now available:
   - press F to limit the scope to the current function
   - press L to limit the scope to the current line
   - press J to increase the scope (starting from the current line) one line below
   - press K to increase the scope one line above
   - navigate between the occurrences with n and N and press TAB to remove an occurrence.
1. Where ever you are, just start editing!

## Text selection

### Highlight to a specific character

Highlight to a specific character, in this case a `#`:

```
v h t #
```

### Listing functions in a buffer

To list all the functions in a buffer and jump to one: spacemacs/helm-jump-in-buffer

```
SPC s j
```

## Text manipulation

### Replacing \n

To replace a bunch of `\n` with actual newlines

* Yank a newline into the clipboard
* Issue a `:`
* Use string subtitution: `%s/\\n/`
* After the last slash in previous step, paste the clipboard of the newline
* Complete your options for replacing the \n: `/g`

### Best way to scale the font up on a Mac

When showing your code on the big screen or to someone near your screen and they say "the text is too small", here is the best way to scale the font up:

1. Choose the change font for mac applications
1. Change the size of the font

## Development 

### Clojurescript

To improve on Cojurescript development within Spacemacs, you need to have the following layer installed:

```
clojure
html
javascript
```

