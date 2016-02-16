---
layout: post
title: "My thoughts and notes from Couchbase conference today"
description: "Durning my attendance of the Couchbase conference, I jotted down notes of what I found interesting."
tags: [databases]
image:
  feature: IMG_0612.JPG
  credit: Aaron Addleman
comments: true
share: true
---

## In General

I found the conference to be helpful for a newbie to Couchbase (formally&nbsp;known as CouchDB). Of the courses I attended I found the following information interesting and took down some notes:

### Performance

* separating view from other stuff on separate file systems improves i/o
* disk bandwidth occasionally drops
* even identical systems may perform differently
* use a membase-aware smart client:
 * to reduce network hops
 * or run moxi on the client host

* couchdb
 * caching, etag, if-none-match
 * compression
 * keep-alive to not open new requests
 * btw, couchbase single server has some killer performance increases coming soon to apache couchdb


* memcached api

* binary protocol more efficient than the ascii protocol
* multi-get and multi-set
* Incr, decr, append, perpend &nbsp;= less traffic
* using TTL expiration, get-and-touch; set and let it go away, not accumulating data; an aggressive TTL

* couchdb api:
 * head vs get, ?limit=1; using head when you need it. when query something long, use limit 1
 * don't overrely on skip, use starkey instead
 * use built-in reduce functions: _sum, _count, _stats, write views in Erlang
 * keep view index sizes in mind
 * using ?group_level to aggregate over structured keys (very fast)
 * emit null, and use ?include_doc; less disk i/o, faster view generation
 * emit more data, so ?include_docs isn't needed (avoid random i/o on query)
 * document size


* fewer items -&gt; less cacheing overhead
* reduce number of requests the clients make
* promotes server-side processing with _show functions
* more context available for flexible maps
* if you have more in your document, you have more meat in to work with or breaking it all up, like fetching something then appending is too expensive, (huh?)
* key size for modeling:


* using short key size. all keys are kept in ram. tracked for replicas, etc.
* 255 bytes max length, but prefer short keys
* at couch db layer, id is likewise used in many places, and short ids are more efficient
* other index types:

* full text integration
* geospatial (can be used for non-spatial data too)
* hadoop connector w/ couchbase server via TAP
* non obvious models in key/value space:

* ex. level indirection to remove a bunch of keys:
* define a master key: eg. 'obj_rev': 3
* define subordinate attribute keys with the master value in the key name "obj_foo-3"
* increment 'obj-rev', and rely on TTL to reap stale attribute items
* not doing deletes on my own. relying on the cache to delete the data. different ways to setup the data
* diagnostics:


* ops/sec: is it dropping?
* ram usage vs high/low water marks: is it getting too close to the high?
* ram injections: reaching a certain point, keep eye on it
* cache miss ratio: what efficiency is it at?
* disk write queue size
* disk space available: more of a operational thing
* error conditions:


* disk write errors in logs
* uptime reset to a low value
* out of memory conditions (*oom*): shows in membased stats from the cluster itself
* swap usage
* can you write views directly in erlang? yes, there is flag and examples for it. just like map and reduce. you get to define how you want to work with it. works inside the couchdb interface. its turned off by default
* what do you mean by group level instruction keys?


* when you emit stuff, it can be an array with lots of items in it. eg. emit a date, then sort by string, but if you split it up, with Year, Month, Day, Time (then use group level to use a group level being awesome)
* what would i pout data store in an array:


* it can be alot faster to restore the data from a crash. instead of relying... puts less strain. striping gives you faster performance. if you choose large stripe sizes. forces couch to allocate more and reduce fragmentation.
* how do you separate your data from view index?


* in your configuration there are parameters. by default they are in the same directory
* emitting null? better than emitting 1?


* about one bit more efficient. its minor, don't worry about it
* compare and contrast performance couch to normal sql setup? trade offs?


* how my data is normalized. if its normalized, to get my data out i need to do a join across multiple machines, which is hard. if its all in a document, no joins are needed. the underlying philosophy is that all your data is in one place and easy to copy.
* comment: updating views, not getting downtime when changing a view:
* if you create a new design doc with a different name, wait for its views, then put the same doc write over the same indexes, and you don't need to wait for the indexes to rebuild. the code is just replaced. (new name and rename it. because it has the same hash, it replaces it) if single doc updates, update handler?


* i like the update handler, its still doing a round trip to the server, no benchmark for performance.

