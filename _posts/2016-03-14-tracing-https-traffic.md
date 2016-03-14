---
layout: post
title: "Tracing HTTPS traffic from Ruby program"
description: "When making HTTP(S) calls from a Ruby program, it helps to trace down what is happening behind the curtain. This article shows how to setup the program Charles Proxy for inspection of the traffic."
tags: [ruby]
image:
  feature: IMG_0141.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

Viewing HTTP or HTTPS traffic with "Charles Proxy" that is not displayed behind the code of a Ruby program.

## Why

Showing this information will help diagnoise what is being sent to the remote end-point.

## How

1. Install [Charles Proxy](https://www.charlesproxy.com/)
1. Save the RootCA certificate from Charles Proxy
1. Point the environment variable called "SSL_CERT_FILE" to the saved file

  ```
  export SSL_CERT_FILE="/Users/aa5d2e3/certs/charles-ssl-proxying-certificate.pem"
  ```
  
1. Poing the environment variable called "http_proxy" to "http://localhost:8888"

  ```
  export http_proxy="http://localhost:8888"
  ```
  
1. Once done, launch Charles Proxy and execute your Ruby script

If the icon for the end-point is a "pad-lock" this indicates you need to enable SSL Proxying. Right click on the hostname of the end-point in the structure list and choose to enable SSL Proxying.

You should now see a new end-point be created with a blue sphere (not a pad lock) and you can now dig down to see all the calles and data returns from the end-point!
