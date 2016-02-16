---
layout: post
title: "NodeJS how to pipe a output from child process into a webpage"
description: ""
tags: [nodejs]
image:
  feature: 8160273128_daa335bd42_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


This is a simple Node.js server that prints the output from a system command (in this example, its a tail program):

{% highlight js %}
    // how to pipe a output from child process into a webpage
    // start with importing an http server
    var http = require('http');
    // import the spawn function
    var spawn = require('child_process').spawn;
    // create the server bound to port at bottom
    http.createServer(function(request, response) {
    // write the header with 200 okay with content-type
    response.writeHead(200, {
    'Content-Type': 'text/plain'
    });
    // everytime there is a new request, spawn an child process
    var tail_child = spawn('tail', ['-f', '/var/log/system.log']);
    // kill tail_child everytime the connection ends to keep from many processes being created
    request.connection.on('end', function() {
    tail_child.kill();
    })
    // observe the output by binding to the data event
    //
    // because javascript is not good at handling buffers, use the function for buffering data
    tail_child.stdout.on('data', function(data) {
    // write it on the console
    console.log(data.toString());
    // send it to the browser because the browser will be waiting for the next chunk of data
    response.write(data);
    });
    }).listen(4000);
{% endhighlight %}