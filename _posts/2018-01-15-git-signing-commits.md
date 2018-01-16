---
layout: post
title: "Signing Git commits with GPG"
description: "Make your git commits with a gpg signature"
tags: [git gpg]
image:
  feature: https://farm5.staticflickr.com/4711/24850125997_483c612e3c_k.jpg
  credit: Aaron Addleman
comments: false
share: true
---

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/ocyrus/24850125997/in/dateposted/" title="IMG_20171227_151258_637"><img src="https://farm5.staticflickr.com/4711/24850125997_483c612e3c_k.jpg" width="2048" height="2048" alt="IMG_20171227_151258_637"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

## why

Make your code changes with a gpg signature to let everyone know the change is from a digital key of your generating. This gets us all closer to the verified change of code by individuals and helps build confidence in submitting data.

## the setup

If your on a Mac like I am, I had to do the following:

1. acquire a gpg private and public key
1. install stuff
  1. brew install gnupg2 pinentry-mac
1. tell brew to overwrite gnupg
  1. `brew link --overwrite gnupg`
  
create a file of /usr/local/bin/pinentry-mac with the contents:

```
$ cat /usr/local/bin/pinentry-mac 
#!/bin/bash
exec "/usr/local/Cellar/pinentry-mac/0.9.4/pinentry-mac.app/Contents/MacOS/pinentry-mac" "$@"
```

get the key id you want to use:

```
gpg --keyid-format LONG --list-keys
```

tell git which key to encrypt with

```
git config user.signingkey KEYID-FROM-CMD-ABOVE
```

tell gpg-agent to use pinentry-mac

```
$ cat ~/.gnupg/gpg-agent.conf 

default-cache-ttl 600
max-cache-ttl 7200
pinentry-program /usr/local/bin/pinentry-mac
```

tell git config to use the gpg2 program

```
git config gpg.program gpg2
```

tell git config to use a credential healper

```
git config --global credential.helper osxkeychain
```

enable git gpg signing 

```
git config commit.gpgsign true
```

