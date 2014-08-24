---
layout: post
title: "Puppet Cheatsheet"
description: "What was that command again to test the module? A template to copy for adding a user goes like what again? Ugh, I need a cheatsheet to help me keep all of this recorded! So here you go, the cheatsheet"
tags: [puppet]
image:
  feature: 8160227607_ba0919e74a_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Puppet Cheatsheet

I really like puppet and there seems like lots to learn. This article is the home of all the examples and methods for managing changes to puppet.

## Apply a single manifest

    :::shell
      %> puppet apply my_test_manifest.pp

## File resource

    :::ruby
    file {'testfile':
          path    => '/tmp/testfile',
          ensure  => present,
          mode    => 0640,
          content => "I'm a test file.",
        }

## User resource

