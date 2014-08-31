---
layout: post
title: "My thoughts and notes from Couchbase conference today"
description: ""
tags: [database]
image:
  feature: IMG_0612.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<h2>In General</h2>
I found the conference to be helpful for a newbie to Couchbase (formally&nbsp;known as CouchDB). Of the courses I attended I found the following information interesting and took down some notes:
<h3>Performance</h3>
<ul>
<li>separating view from other stuff on separate file systems improves i/o</li>
<li>disk bandwidth occasionally drops</li>
<li>even identical systems may perform differently</li>
<li>use a membase-aware smart client:</li>
</ul>
<ul>
<li>to reduce network hops</li>
<li>or run moxi on the client host</li>
</ul>
<ul>
<li>couchdb</li>
</ul>
<ul>
<li>caching, etag, if-none-match</li>
<li>compression</li>
<li>keep-alive to not open new requests</li>
<li>btw, couchbase single server has some killer performance increases coming soon to apache couchdb</li>
</ul>
<ul>
<li>memcached api</li>
</ul>
<ul>
<li>binary protocal more effcient than the ascii protocol</li>
<li>multi-get and multi-set</li>
<li>Incr, decr, append, prepend &nbsp;= less traffic</li>
<li>using TTL expiriation, get-and-touch; set and let it go away, not accumulating data; an aggressive TTL</li>
</ul>
<ul>
<li>couchdb api:</li>
</ul>
<ul>
<li>head vs get, ?limit=1; using head when you need it. when query something long, use limit 1</li>
<li>dont overrely on skip, use starkey instead</li>
<li>use built-in reduce functions: _sum, _count, _stats, write views in Erlang</li>
<li>keep view index sizes in mind</li>
<li>using ?group_level to aggregate over structured keys (very fast)</li>
<li>emit null, and use ?include_doc; less disk i/o, faster view generation</li>
<li>emit more data, so ?include_docs isn't needed (avoid random i/o on query)</li>
<li>document size</li>
</ul>
<ul>
<li>fewer items -&gt; less cacheing overhead</li>
<li>reduce number of requests the clients make</li>
<li>promotes server-side processing with _show functions</li>
<li>more context available for flexible maps</li>
<li>if you have more in your document, you have more meat in to work with or breaking it all up, like fetching something then appending is too expensive, (huh?)</li>
<li>key size for modeling:</li>
</ul>
<ul>
<li>using short key size. all keys are kept in ram. tracked for replicas, etc.</li>
<li>255 bytes max length, but prefer short keys</li>
<li>at couch db layer, id is likewise used in many places, and short ids are more efficient</li>
<li>other index types:</li>
</ul>
<ul>
<li>full text integration</li>
<li>geospatial (can be used for non-spatial data too)</li>
<li>hadoop connector w/ couchbase server via TAP</li>
<li>non obvious models in key/value space:</li>
</ul>
<ul>
<li>ex. level indirection to remove a bunch of keys:</li>
<li>define a master key: eg. 'obj_rev': 3</li>
<li>define subordanate attribue keys with the master value in the key name "obj_foo-3"</li>
<li>increment 'obj-rev', and rely on TTL to reap stale attribute items</li>
<li>not doing deletes on my own. relying on the cache to delete the data. different ways to setup the data</li>
<li>diagnoticsts:</li>
</ul>
<ul>
<li>ops/sec: is it dropping?</li>
<li>ram usage vs high/low water marks: is it getting too close to the high?</li>
<li>ram injections: reaching a certain point, keep eye on it</li>
<li>cache miss ratio: what effcienty is it at?</li>
<li>disk write queue size</li>
<li>disk space available: more of a operational thing</li>
<li>error conditions:</li>
</ul>
<ul>
<li>disk write errors in logs</li>
<li>uptime reset to a low value</li>
<li>out of memory conditions (*oom*): shows in membased stats from the cluster itself</li>
<li>swap usage</li>
<li>can you write views directly in erlang? yes, there is flag and examples for it. just like map and reduce. you get to define how you want to work with it. works inside the couchdb interface. its turned off by default</li>
<li>what do you mean by group level instruction keys?</li>
</ul>
<ul>
<li>when you emit stuff, it can be an array with lots of items in it. eg. emit a date, then sort by string, but if you split it up, with Year, Month, Day, Time (then use group level to use a group level being awesome)</li>
<li>what would i pout data store in an array:</li>
</ul>
<ul>
<li>it can be alot faster to restore the data from a crash. instead of relying... puts less strain. striping gives you faster performance. if you choose large stripe sizes. forces couch to allocate more and reduce fragmentation.</li>
<li>how do you separate your data from view index?</li>
</ul>
<ul>
<li>in your config there are paramaters. by default they are in the same directory</li>
<li>emiting null? better than emiting 1?</li>
</ul>
<ul>
<li>about one bit more efficient. its minor, dont worry about it</li>
<li>compare and contrast performance couch to normal sql setup? trade offs?</li>
</ul>
<ul>
<li>how my data is normalized. if its normalized, to get my data out i need to do a join across multiple machines, which is hard. if its all in a document, no joins are needed. the underlying philosophy is that all your data is in one place and easy to copy.</li>
<li>comment: updating views, not getting downtime when changing a view:</li>
<li>if you create a new design doc with a diffeent name, wait for its views, then put the same doc write over the same indexs, and you dont need to wait for the indexes to rebuild. the code is just replaced. (new name and rename it. because it has the same hash, it replaces it) if single doc updates, update handler?</li>
</ul>
<ul>
<li>i like the update handler, its still doing a round trip to the server, no benchmark for performance.</li>
</ul>
