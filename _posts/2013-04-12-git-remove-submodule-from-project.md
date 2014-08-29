---
layout: post
title: "Remove a submodule from a git project"
description: "Recently ran into a problem where a submodule was added to a project and I needed to remove it. Here are some simple steps to remove the submodule."
tags: [git]
image:
  feature: 8160237453_62c4c8c48e_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Remove a submodule from a git project

Within your project directory follow these steps to remove the submodule:

1. Delete the relevant section from the `.gitmodules` file
1. Delete the relevant section from `.git/config`
1. Run with no trailing slash `git rm --cached path_to_submodule`
1. Commit
1. Delete the now untracked submodule files `rm -rf path_to_submodule`
