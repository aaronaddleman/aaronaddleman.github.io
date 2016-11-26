---
layout: post2
title: "Clojure and Spacemacs"
description: "How to use Clojure and Spacemacs together"
tags: [emacs]
image:
  feature: https://c6.staticflickr.com/6/5502/30441913661_b19df3bbe9_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Errors I have found

A list of errors I have found and how to resolve them. Honestly, I think there is a good posibility that I will run into these errors again and being prepared never hurt. Hope this helps anyone else out too.

{% for error in site.data.clojure %}
### {{ error.name }}

#### Description

<figure class="highlight"><pre><code>{{ error.problem }}</code></pre></figure>

#### Solution

{{ error.solution }}

#### Code

<figure class="highlight"><pre><code>{{ error.solution-code }}</code></pre></figure>

#### References

{% for reference in error.references %}
1. [{{ reference.name }}]({{ reference.url}})
{% endfor %}

{% endfor %}


## Starting a REPL

To start a REPL inside of Spacemacs, run the following:

```
M-x cider-jack-in
```

Or you can type the following:

```
Spc M '
```
