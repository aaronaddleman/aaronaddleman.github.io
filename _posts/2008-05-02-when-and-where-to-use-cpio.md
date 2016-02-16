---
layout: post
title: "when, where, and how to use cpio "
description: ""
tags: [sysadmin]
image:
  feature: DSC03476.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>I have been using cpio many times and never settled on my favorite combination between operating system, hard drive block size, and best options to use. So I think its about time I dedicate some space to recording down my personal preferences so I do not have to keep reading the manual page once every blue moon while holding my elbow at a 45 degree angle.
<strong><em>Update (20080923 15:14:39): <span style="font-weight: normal;">In an attempt to transfer some files via FTP I found out a problem during an attempt to transfer RPM files. I tried using TAR but with no success. CPIO to the rescue!</span></em></strong>
</p>
<h2>Making the archive</h2>
I to use this method for archiving a directory for transportation to another server or for archiving purposes:
<span style="font-family: terminal,monaco;">find /path/to/start -type f | cpio -ovcBO /path/to/archive.cpio</span>
This says to find the files in the path of /path/to/start and look for only the file type of "file" (as opposed to block, character, directories, named pipes, symbolic links, sockets or doors)  and then send that list off to cpio that says to:
<ul>
<li>-o accept incoming from the find command</li>
<li>-v be verbose and tell us what file it is reading</li>
<li>-c use the new SRV4 portable format</li>
<li>-B set the I/O block size to BLOCK-SIZE * 512 bytes</li>
<li>-O save to the archive file of /path/to/archive.cpio</li>
</ul>
I think this would be nice to bzip up as well to save time in transferring, but I will save that for a later update of this article.
<h2>Storing the archive on MSDOS partition that will be larger than 2GB</h2>
The file size limitation of MSDOS is annoying and old. To get around this problem, I used the program called split. But using split on a already existing file is boring. Lets use the output from gzip! Use the -b 1000m to limit each split to 1gb of data
<span style="font-family: terminal, monaco;">find /files/to/find/ -depth -print | cpio -oaV | gzip -c | split -d -b 1000m &gt; &nbsp;/mnt/target
</span>
<h2>Transferring between two hosts via ssh</h2>
If you need to copy files between two hosts via ssh. I came to find that this was my best option for keeping the modification times and permisssions:
<span style="font-family: terminal,monaco;">ssh username@host "cd /to/path &amp;&amp; find dir -depth -print | cpio -oacV" | cpio -imVd</span>
What the above does is ssh to the remote host, change directory to where you have your data, find files in "dir" and copy them to the current directory of where you initiate this command.
<h2>Error messages</h2>
If you receive this error message:
<blockquote>truncating inode number</blockquote>
I have found that using the -c option will help allow for being compatible with your system.
<h2>Restoring</h2>
To restore your cpio archive, use the following:
<span style="font-family: terminal,monaco;">cpio -ivcI &lt;archive path name&gt;</span>
