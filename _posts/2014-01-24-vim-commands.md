---
layout: post
title: "VIm commands"
description: "VIm is a great editor and I have used it for many years. However, mastering the indepth commands are very helpful for System Administrators because its almost always available. Here are some helpful commands to remember."
tags: [sysadmin]
image:
  feature: IMG_0009.jpg
  credit: Aaron Addleman
comments: true
share: true
---


To become an expert in VIm takes lots of pratice. This article is a place for me to remember the commands and how they are used. I hope you find it useful.

## Saving changes to a file

<kbd>Shift</kbd> + <kbd>:</kbd> write

or

<kbd>Shift</kbd> + <kbd>:</kbd> w

or

<kbd>Z</kbd> <kbd>Z</kbd>

## Quiting vim

<kbd>Shift</kbd> + <kbd>:</kbd> quit

<kbd>Shift</kbd> + <kbd>:</kbd> q

## Marking

<kbd>m</kbd> then <kbd>x</kbd>

> Marks the current position with x (x can be any letter). (The original vi allows only lowercase letters. Vim distinguishes between uppercase and lowercase letters.)

<kbd>``</kbd>

> Returns to the exact position of the previous mark or context after a move.

## Search

<kbd>/</kbd> pattern

> Look forward for the _pattern_.

## Replace

    :50,100s/ old/ new/ g

> Replace all occurances of old with new between lines 50 and 100.

    :1,30s/ his/ the/ gc

> Confirm all replacements of his with the between lines 1 and 30. 

> 1. Use <kbd>n</kbd> to goto the next match. 
> 1. Use <kbd>.</kbd> to repeat a change.

    :g/pattern/s/old/new/g

> The _first_ <kbd>g</kbd> tells the command to operate on all lines of a file. _pattern_ identifies the lines on which a substitution is to take place. On those lines containing pattern, ex is to substitute (<kbd>s</kbd>) for old the characters in new. The _last_ <kbd>g</kbd> indicates that the substitution is to occur globally on that line.

## Pattern matching rules

    . 

> (period, dot) Matches any single character except a newline. Remember that spaces are treated as characters. For example, p.p matches character strings such as pep, pip, and pcp.

    *

> Matches zero or more (as many as there are) of the single character that immediately precedes it. For example, bugs* will match bugs (one s) or bug (no s). (It will also match bugss, bugsss, and so on.) The * can follow a metacharacter. For example, since . (dot) means any character, .* means “match any number of any character.” Here’s a specific example of this: the command :s/ End.*/ End/ removes all characters after End (it replaces the remainder of the line with nothing).

    ^

> When used at the start of a regular expression, requires that the following regular expression be found at the beginning of the line. For example, ^ Part matches Part when it occurs at the beginning of a line, and ^... matches the first three characters of a line. When not at the beginning of a regular expression, ^ stands for itself.

    $

> When used at the end of a regular expression, requires that the preceding regular expression be found at the end of the line; for example, here: $ matches only when here: occurs at the end of a line. When not at the end of a regular expression, $ stands for itself.

    \

> Treats the following special character as an ordinary character. For example, <kbd>\\.</kbd> matches an actual period instead of “any single character,” and <kbd>\\*</kbd> matches an actual asterisk instead of “any number of a character.” The <kbd>\\</kbd> (backslash) prevents the interpretation of a special character. This prevention is called “escaping the character.” (Use <kbd>\\\\</kbd> to get a literal backslash.)

## External

    :r !date

> You can combine :read with a call to Unix, to read the results of a Unix command into your file.
