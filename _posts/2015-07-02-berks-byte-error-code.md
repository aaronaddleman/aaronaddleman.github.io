---
layout: post
title: "Error with berks encode error \xE2"
description: "fixing error with berks in OS X"
tags: [chef]
image:
  feature: abstract-6.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true
---

## What

While using the berks utility to upload some cookbooks, I ran into this error. Tried all types of stuff.

{% highlight bash %}
Hiigara:my-server-cloud aaddleman$ berks vendor cookbooks
/Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/json-1.8.2/lib/json/common.rb:155:in `encode': "\xE2" on US-ASCII (Encoding::InvalidByteSequenceError)
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/json-1.8.2/lib/json/common.rb:155:in `initialize'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/json-1.8.2/lib/json/common.rb:155:in `new'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/json-1.8.2/lib/json/common.rb:155:in `parse'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/ridley-4.1.2/lib/ridley/chef/cookbook/metadata.rb:473:in `from_json'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/ridley-4.1.2/lib/ridley/chef/cookbook/metadata.rb:29:in `from_json'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/ridley-4.1.2/lib/ridley/chef/cookbook.rb:36:in `from_path'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cached_cookbook.rb:15:in `from_store_path'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cookbook_store.rb:108:in `block in cookbooks'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cookbook_store.rb:98:in `collect'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cookbook_store.rb:98:in `cookbooks'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cookbook_store.rb:163:in `satisfy'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/dependency.rb:139:in `cached_cookbook'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/lockfile.rb:399:in `block in reduce!'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/lockfile.rb:384:in `each'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/lockfile.rb:384:in `reduce!'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/installer.rb:32:in `run'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/berksfile.rb:374:in `install'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/berksfile.rb:583:in `block in vendor'
	from /Users/aaddleman/.rvm/rubies/ruby-2.0.0-p645/lib/ruby/2.0.0/tmpdir.rb:88:in `mktmpdir'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/berksfile.rb:581:in `vendor'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cli.rb:387:in `vendor'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/thor-0.19.1/lib/thor/command.rb:27:in `run'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/thor-0.19.1/lib/thor/invocation.rb:126:in `invoke_command'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/thor-0.19.1/lib/thor.rb:359:in `dispatch'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cli.rb:52:in `dispatch'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/thor-0.19.1/lib/thor/base.rb:440:in `start'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/lib/berkshelf/cli.rb:27:in `execute!'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/gems/berkshelf-3.2.3/bin/berks:5:in `<top (required)>'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/bin/berks:23:in `load'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/bin/berks:23:in `<main>'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/bin/ruby_executable_hooks:15:in `eval'
	from /Users/aaddleman/.rvm/gems/ruby-2.0.0-p645@my-server-cloud/bin/ruby_executable_hooks:15:in `<main>'
{% endhighlight %}

## How

The fix was found on https://github.com/berkshelf/berkshelf/issues/1399 by doing the following:

{% highlight bash %}
export LC_CTYPE=en_US.UTF-8
{% endhighlight %}
