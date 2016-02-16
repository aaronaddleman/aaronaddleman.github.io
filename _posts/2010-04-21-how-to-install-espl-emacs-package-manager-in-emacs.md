---
layout: post
title: "How to install ELPA emacs package manager in Emacs"
description: ""
tags: [emacs]
image:
  feature: 8160262732_04666c38b1_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Today I sat down this morning to install some packages and just learned about the <a href="http://tromey.com/elpa/index.html">package manager for Emacs called espl</a>. I also installed this behind my proxy server by setting my http_proxy variable. Here are my steps for installing ELPA:

Use the following lisp code (<a href="http://tromey.com/elpa/install.html">from the Emacs ELPA install website</a>)</li>

{% highlight lisp %}
    (let ((buffer (url-retrieve-synchronously "http://tromey.com/elpa/package-install.el")))
    (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (re-search-forward "^$" nil 'move)
    (eval-region (point) (point-max))
    (kill-buffer (current-buffer))))
{% endhighlight %}

## Steps for installing ELPA

1. Start your Emacs program if you have not already</li>
1. Paste the text into a new buffer with `C-y`
1. Move your cursor to the last line in your buffer to evaluate the lisp code `ESC &gt;`
1. Execute the lisp code with `C-x C-e`
1. The ELPA&nbsp;package manager should be installed. 

## Using the package manager

List packages with `M-x package-list-packages`

To get out of the package manager, hit the letter "`q`"
# What to do with ELPA?
If you have followed the steps above, you should see a list of packages that are available for installation. Next question you might have is "what the hell should I do now?". Well good question. What follows in this section is some examples of what is possible with the package manager.

## Example: Installing the haml-mode

Lets say you are writing some code in the HAML language. You are using HAML right? Well if you are not, you damn well should be! HaHa just kidding. But really, you should be writing in HAML.

Use `C-s` to enter search mode and type in "`haml`". Notice each time you type the letters, emacs will highlight the next full match of your input. When you arrive at the package titled "haml-mode", hit the "Enter" button to end your search, and then the letter "i" to toggle installation of this awesome package.

To install the selected package, use the key "x"

Note: I am not sure if this is just me, but while emacs decides to contact the host, I hit my down arrow key to make sure its not sleeping on the job. Again, thats just me probably being impatient.
