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

## What I found

There are a couple of things you want to setup:

1. the GOPATH which points to your go binary you have downloaded
1. your PATH that points to `$(go env GOPATH)/bin` which will allow you to use binaries that have been installed by `go get ...`
1. (optionally) `GOROOT` which is where your go world lives

## TDD

https://golang.org/pkg/testing/
