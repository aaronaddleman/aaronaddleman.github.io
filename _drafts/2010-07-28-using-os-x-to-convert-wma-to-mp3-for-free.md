---
layout: post
title: "Using VLC to Convert WMA to MP3 for free"
description: "How to convert WMA files into MP3 for free using the open source program called VLC."
tags: [osx]
image:
  feature: 11788942253_6c55c0f770_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## My History with VLC

I rarely need to convert files on my Mac, but when I do, I seem to think I have to find some type of weird audio program to help. My usual pattern to solve this problem was to go onto google.com and put in "convert wma to mp3" and hope for the best. But tonight was different. While playing around with the program VLC, I noticed a menu item that I have never used before: "Streaming/Exporting Wizard". This option allows for doing just as it suggests, but after playing around with some options, I found out that VLC can convert WMA files to MP3 files!

## Here are the steps

* Open the WMA file(s) in VLC
* Goto File -&gt; Streaming/Export Wizard
* Choose "Transcode/Save to file" and click Next
* Choose "Existing playlist item" and highlight the items you want converted and click Next
* Because I was converting audio, I used the "Transcode audio" option
* Set the codec to "MP3" and choose your bitrate (I went with default of 192) and click Next
* Set your encapsulation to "RAW" and click Next
* Set your destination directory and click Next and it should start converting!

## Update - Dec 12, 2013

Here are some screen shots of the steps I took and I also noticed that the converted file did not appear until I played the song. Good Luck !!

### Step 1
![vlc os x convert wma to mp3 step 1](/images/vlc_step1.png "vlc os x convert wma to mp3 step 1")

### Step 2
![vlc os x convert wma to mp3 step 2](/images/vlc_step2.png "vlc os x convert wma to mp3 step 2")

### Step 3
![vlc os x convert wma to mp3 step 3](/images/vlc_step3.png "vlc os x convert wma to mp3 step 3")

### Step 4
![vlc os x convert wma to mp3 step 4](/images/vlc_step4.png "vlc os x convert wma to mp3 step 4")

### Step 5
![vlc os x convert wma to mp3 step 5](/images/vlc_step5.png "vlc os x convert wma to mp3 step 5")

### Step 6
![vlc os x convert wma to mp3 step 6](/images/vlc_step6.png "vlc os x convert wma to mp3 step 6")

### Step 7
![vlc os x convert wma to mp3 step 7](/images/vlc_step7.png "vlc os x convert wma to mp3 step 7")

### Step 8
![vlc os x convert wma to mp3 step 8](/images/vlc_step8.png "vlc os x convert wma to mp3 step 8")

### Step 9
![vlc os x convert wma to mp3 step 9](/images/vlc_step9.png "vlc os x convert wma to mp3 step 9")


## Using Automator to rename

Afterwards I used Automator to rename my files from "Song Title.wma.raw" to "Song Title.mp3" by:

* Dragging the audio files onto Automator
* Adding "Rename Finder Items"
* Set the operation of the "Rename Finder Items" to "Replace Text"
* Find = .wma.raw
* Replace = .mp3
* Click Run!
