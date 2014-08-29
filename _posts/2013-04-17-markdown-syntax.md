---
layout: post
title: "Markdown Cheat Sheet"
description: "When authoring some content in markdown I was missing a cheat sheet for the syntax. So here it is a cheat sheet for the markdown syntax."
tags: [cheatsheets]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Headers

    # This is an H1
    ## This is an H2
    ###### This is an H6

    # This is an H1 #
    ## This is an H2 ##
    ### This is an H3 ######

## Block quotes

### Block quote

    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
    > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
    > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
    > 
    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
    > id sem consectetuer libero luctus adipiscing.

### Block quote with large paragraph

    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
    consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
    Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.

    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
    id sem consectetuer libero luctus adipiscing.

### Block quote nested

    > This is the first level of quoting.
    >
    > > This is nested blockquote.
    >
    > Back to the first level.

### Block quote with mixed styling

    > ## This is a header.
    > 
    > 1.   This is the first list item.
    > 2.   This is the second list item.
    > 
    > Here's some example code:
    > 
    >     return shell_exec("echo $input | $markdown_script");

## Lists

### Unordered List

    *   Red
    *   Green
    *   Blue

same as

    +   Red
    +   Green
    +   Blue

and same as 

    -   Red
    -   Green
    -   Blue

### Ordered lists

    1.  Bird
    2.  McHale
    3.  Parish

makes this:

    <ol>
    <li>Bird</li>
    <li>McHale</li>
    <li>Parish</li>
    </ol>

all of these will produce the same list

    1.  Bird
    1.  McHale
    1.  Parish

or

    3. Bird
    1. McHale
    8. Parish

### Lists with hanging elements

    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
        Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,
        viverra nec, fringilla in, laoreet vitae, risus.
    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
        Suspendisse id sem consectetuer libero luctus adipiscing.

or you can be lazy

    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,
    viverra nec, fringilla in, laoreet vitae, risus.
    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
    Suspendisse id sem consectetuer libero luctus adipiscing.

### Lists with p elements

    *   Bird

    *   Magic

will turn into this

    <ul>
    <li><p>Bird</p></li>
    <li><p>Magic</p></li>
    </ul>

### Lists with multiple paragraphs

    1.  This is a list item with two paragraphs. Lorem ipsum dolor
        sit amet, consectetuer adipiscing elit. Aliquam hendrerit
        mi posuere lectus.

        Vestibulum enim wisi, viverra nec, fringilla in, laoreet
        vitae, risus. Donec sit amet nisl. Aliquam semper ipsum
        sit amet velit.

    2.  Suspendisse id sem consectetuer libero luctus adipiscing.

or you can be lazy

    *   This is a list item with two paragraphs.

        This is the second paragraph in the list item. You're
    only required to indent the first line. Lorem ipsum dolor
    sit amet, consectetuer adipiscing elit.

    *   Another item in the same list.

### List with block quote

    *   A list item with a blockquote:

        > This is a blockquote
        > inside a list item.

### List with code


    *   A list item with a code block:

            <code goes here>

### When you don't want a list

    1986\. What a great season.

## Code blocks

    This is a normal paragraph:

        This is a code block.

## Code blocks with coloring

color like this

    This is a normal paragraph:
        
        {% raw %}
        {% highlight ruby %}
        def foo
          print "foo"
        end
        {% endhighlight %}
        {% endraw }

and you should get this:


## Horizontal rules

    * * *
    
    ***

    *****

    - - -
    
    ---------------------------------------


## Span elements

### Links

Making a link like this

    This is [an example](http://example.com/ "Title") inline link.

    [This link](http://example.net/) has no title attribute.

will make this

    <p>This is <a href="http://example.com/" title="Title">
    an example</a> inline link.</p>

    <p><a href="http://example.net/">This link</a> has no
    title attribute.</p>

### Links on the local source

    See my [About](/about/) page for details.   

### Reference style

    This is [an example][id] reference-style link.
    This is [an example] [id] reference-style link.

    [id]: http://example.com/  "Optional Title Here"

all are accepted:

    [foo]: http://example.com/  "Optional Title Here"
    [foo]: http://example.com/  'Optional Title Here'
    [foo]: http://example.com/  (Optional Title Here)
    [foo]: <http://example.com/>  "Optional Title Here"
    [foo]: http://example.com/longish/path/to/resource/here
      "Optional Title Here"

### Link definitions

put the link inside your text

    Visit [Daring Fireball][] for more information.

then define the link with

    [Daring Fireball]: http://daringfireball.net/

## Emphasis

### Examples

    *single asterisks*

    _single underscores_

    **double asterisks**

    __double underscores__

    un*frigging*believable in the middle of words

### If you really want a \*

    \*this text is surrounded by literal asterisks\*

## Images

use this in your text

    ![Alt text][id]

and then define with

    ![Alt text](/path/to/img.jpg)

    ![Alt text](/path/to/img.jpg "Optional title")

    [id]: url/to/image  "Optional title attribute"

## Backslash escapes

a backslash will escape the following

    \   backslash
    `   backtick
    *   asterisk
    _   underscore
    {}  curly braces
    []  square brackets
    ()  parentheses
    #   hash mark
    +   plus sign
    -   minus sign (hyphen)
    .   dot
    !   exclamation mark
