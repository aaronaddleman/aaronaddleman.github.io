---
layout: post
title: "Ruby spidering and storing in MongoDB"
description: "Notes on mongodb and how I use it."
tags: [databases]
image:
  feature: DSC03476_m.jpeg
  credit: Aaron Addleman
comments: true
share: true
---

## First install Mongodb with brew

Installing with brew:

    ==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/mongodb-2.4.6.mountain_lion.bottle.1.tar.gz
    ######################################################################## 100.0%
    ==> Pouring mongodb-2.4.6.mountain_lion.bottle.1.tar.gz
    ==> Caveats
    To have launchd start mongodb at login:
        ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
    Then to load mongodb now:
        launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    Or, if you don't want/need launchctl, you can just run:
        mongod
    ==> Summary
    🍺  /usr/local/Cellar/mongodb/2.4.6: 19 files, 289M

## Run mongo

    mongod

## Crawling websites with Ruby

{% highlight ruby %}
    require 'anemone'
    require 'redis'
    require 'digest/md5'
    require 'mongo'
    include Mongo

    ### set mongo information
    mongo_client = MongoClient.new("localhost", 27017)
    db = mongo_client.db("pageinfo")
    coll = db.collection("pagehash")

    begin
      # make sure that the first option is a URL we can crawl
      # root = URI(ARGV[0])
      root = URI("http://example.com/")
    rescue
      puts <<-INFO
    Usage:
      script.rb pagedepth <url>

    Synopsis:
      Crawls a site starting at the given URL and outputs a count of
      the number of pages at each depth of the crawl.
    INFO
      exit(0)
    end

    Anemone.crawl(root) do |anemone|
      anemone.storage = Anemone::Storage.MongoDB
      ### only crawl the first 11 links
      # anemone.focus_crawl { |page| page.links.slice(0..10) }
      ### skip links ending with some extentions
      anemone.skip_links_like %r{.*(pdf|jpg|png)$}
      anemone.on_every_page { |page| puts page.url.to_s rescue nil }
      anemone.after_crawl do |pages|
        pages = pages.shortest_paths!(root).uniq!
        pages.values.each do |p|
          @document = {"url" => p.url.to_s, "md5string" => Digest::MD5.hexdigest(p.body.to_s)}
          @row = coll.save(@document)
        end
      end
    end
{% endhighlight %}

## To display mongo records with irb

    # set mongo variables
    require 'mongo'
    include Mongo
    mongo_client = MongoClient.new("localhost", 27017)
    # list datbases
    mongo_client.database_names
    # list collection names
    db.collection_names
    db = mongo_client.db("pageinfo")
    coll = db.collection("pagehash")

    # find records
    coll.find_one
    coll.find.each { |row| puts row.inspect }

## To drop the records

    coll.remove

## Observations

Any links result in the md5 string '1af86fe6681beb9d637351f065d9f4c6'.
