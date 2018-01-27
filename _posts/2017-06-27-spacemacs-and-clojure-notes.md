---
layout: post2
title: "Spacemacs and Clojure"
description: "How to use Spacemacs and Clojure"
tags: [spacemacs clojure]
image:
  feature: https://c1.staticflickr.com/5/4245/34472742224_9785db703c_k.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Overview

When making a Clojure project in Spacemacs, there are some helpful shortcuts and items that I have found useful.

### The Repl

Open up your project.clj file and type

```
SPC m s i
```

This starts up a buffer for your project. Sometimes the buffer does not always show. 
In this case you have two options to switch to the new buffer:

```
SPC b b
```

or

```
SPC b a
```

### Evaluating lisp code

To try out the entire buffer of code, type:

```
SPC m e b
```

To evaluate a small block of code:

```
SPC m e e
```
