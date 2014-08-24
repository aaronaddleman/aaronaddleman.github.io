---
layout: post
title: "Add new syntax into Nestacms for use with Ultraviolet and Textpow"
description: "While using Nestacms, I wanted to add a new syntax to Textpow and Ultraviolet for parsing some varnish configuration language files (or vcl files) to display on my web site. My adventure on this turned out to be easy once I realized how cool Nesta really is!"
Categories: categories/ruby
tags: [ ruby ]
image:
  feature: abstract-3.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true
---

## How to start

Make sure you have all the necessary changes to Nestacms for [Setting up rack-codehighligher with Nestacms][rack_article].

## Converting a Textmate Syntax bundle

Download the bundle (usually from a github respository) to get ready for conversion. Once you have the `Language.tmLanguage` convert the language file to a yaml file which should end up with a file name like `source.Language.syntax` by using this command:

    {% uvhighlight lang=shell %}
    plist2yaml Language.tmLanguage > source.Language.syntax
    {% enduvhighlight %}

If you get an error like the following you need to be inside the `Language.tmbundle/Syntaxes` directory where the `.tmLanuage` file is located:

    {% uvhighlight lang=shell %}
    /Users/aaron/.rvm/gems/ruby-1.9.2-p320/gems/plist-3.1.0/lib/plist/parser.rb:67:in `read': Is a directory - Varnish.tmbundle (Errno::EISDIR)
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/gems/plist-3.1.0/lib/plist/parser.rb:67:in `initialize'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/gems/plist-3.1.0/lib/plist/parser.rb:28:in `new'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/gems/plist-3.1.0/lib/plist/parser.rb:28:in `parse_xml'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/gems/textpow-1.3.0/bin/plist2yaml:7:in `<top (required)>'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/bin/plist2yaml:19:in `load'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/bin/plist2yaml:19:in `<main>'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/bin/ruby_noexec_wrapper:14:in `eval'
      from /Users/aaron/.rvm/gems/ruby-1.9.2-p320/bin/ruby_noexec_wrapper:14:in `<main>'
      {% enduvhighlight %}

## Load the syntax file into Nestacms

By adding the following code into your app.rb file the syntax will be available:

    {% uvhighlight lang=ruby %}
    Textpow::SyntaxNode.load(File.expand_path('public/syntaxes/source.vcl.syntax', Nesta::App.root))
    {% enduvhighlight %}

## Use the syntax on you files

To apply the syntax I came up with some code for printing code from the `app.rb` file by making this method:

    {% uvhighlight lang=ruby %}
    # load custom syntaxes
    Textpow::SyntaxNode.load(File.expand_path('public/syntaxes/source.vcl.syntax', Nesta::App.root))

    def print_code(opt={})
      filename = opt[:filename]
      theme = opt[:theme] || "brilliance_black"
      syntax = opt[:syntax]
      show_code = opt[:show_code] || true

      text = File.read(Dir.pwd + '/public/' + filename)
      processor = Textpow::RecordingProcessor.new
      result = Uv.parse( text, "xhtml", syntax, false, "eiffel")

      haml(:print_code, :layout => false, :locals => { :code => result, :filename => filename })

      case show_code
      when true
        return haml(:print_code, :layout => false, :locals => { :code => result, :filename => filename })
      when false
        return download_link
      end
    end
    {% enduvhighlight %}

Now when you want to call some code, make a `haml` file and include the file with the following:

    {% uvhighlight lang=shell %}
    = print_code("file_with_language.vcl")
    {% enduvhighlight %}

    {% uvhighlight lang=shell %}
function inthefile() {
  export set VAR="this code is inside the article"
}
    {% enduvhighlight %}

# Notes

To list the availble syntaxes:

    {% uvhighlight lang=shell %}
    uv --list syntaxes
    {% enduvhighlight %}

[rack_article]: /articles/rack-codehighligher
