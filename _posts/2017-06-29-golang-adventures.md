---
layout: post2
title: "GO Lang Adventures"
description: "Learning the Go Language and my mistakes"
tags: [go golang]
image:
  feature: https://c1.staticflickr.com/5/4231/34505818533_01f59d2a60_k.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Starting with Go Language

As with most languages, I start with trying to find a good method for setting up a project, linters, and some examples of TDD. I did not realize at the time what the whole ideal structre was for the Go language, which caused me to search for something that did not exist: the perfect project template.

## The Setup

There are a couple of things you want to setup:

1. the GOPATH which points to your go binary you have downloaded
1. your PATH that points to `$(go env GOPATH)/bin` which will allow you to use binaries that have been installed by `go get ...`
1. (optionally) `GOROOT` which is where your go world lives

Still using my latest choice of editors `Spacemacs` I have found, I wanted to see what layers are available. The [Go Layer](https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/go) has a nice list of things to do:

```
# run this after installing go, and setting your paths
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
```

decide if you want to go with the stable version or the latest version of the gometalinter

(stable)
```
# stable, binary is gometalinter.v1
go get -u gopkg.in/alecthomas/gometalinter.v1
gometalinter.v1 --install --update
# latest, binary is gometalinter
go get -u -v github.com/alecthomas/gometalinter
gometalinter --install --update
```

Add stuff to your .spacemacs file for customization in your layers 

```
   dotspacemacs-configuration-layers
   '(
     ruby
     python
     go
     (go :variables go-use-gometalinter t
                    go-tab-width 2  
     )
   )
```

and here are some helpful commands that I found useful:

```
# run your tests
SPC m t s 
```

## TDD

https://golang.org/pkg/testing/

## Books

I [a nice github repo](https://github.com/dariubs/GoBooks) which list many free books and paid books of the Go language.
