---
layout: howtos
title: Spacemacs
---

(put collection of spacemacs here)
## Text selection

### Highlight to a specific character

Highlight to a specific character, in this case a `#`:

```
v h t #
```

## Text manipulation

### Replacing \n

To replace a bunch of `\n` with actual newlines

* Yank a newline into the clipboard
* Issue a `:`
* Use string subtitution: `%s/\\n/`
* After the last slash in previous step, paste the clipboard of the newline
* Complete your options for replacing the \n: `/g`

## Development 

### Clojurescript

To improve on Cojurescript development within Spacemacs, you need to have the following layer installed:

```
clojure
html
javascript
```


