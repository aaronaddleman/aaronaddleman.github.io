---
layout: post
title: "When having problems with Gitosis on Ubuntu"
description: ""
tags: [uncategorized]
image:
  feature: 11786474283_9f0f30e96c_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<h3>Problems with gitosis</h3>
While working on my Ubuntu server with the Gitosis default setup, I ran into some problems along the way when trying to commit some changes:
<ol>
<li>Lost ability to update the gitosis-admin repository</li>
<li>Various python errors</li>
<li>Expected changes to gitosis.conf file but they were not being applied</li>
</ol>
Below is a description of what I did to trace down the error(s) and try to fix them.
<h3>Gitosis debug</h3>
Setting the debug into the gitosis.conf file really helped me out. To achieve this, you must have the following in your gitosis.conf file:
<pre>[gitosis]
loglevel = DEBUG</pre>
After this has been setup, you can run your push command to get a better idea of what is going wrong. Some of the problems I got are listed below with a explanation of what I did to try and resolve the issue:
<h3>gitosis.conf not updated after a push</h3>
This was a mystery. I cloned off the files from the gitosis-admin repo and then made some changes to the gitosis.conf file. Then after pushing them to the origin master, I noticed my changes did not take effect when looking at the file:
<pre>cat /srv/gitosis/.gitosis.conf</pre>
I noticed that there is a hook file in the directory of
<pre>/srv/gitosis/repositories/gitosis-admin.git/hooks/</pre>
with the filename of:
<pre>/usr/share/pyshared/gitosis/templates/admin/hooks/post-update</pre>
(Small note here, take note of the directory of where this file is because the part of /usr/share/pyshared is what you need for setting your PYTHONPATH) Running the above script&nbsp;occurs&nbsp;after applying a push to the gitosis-admin repository. I figured this was where the hold up was. After running this script manually, I got more errors (which I don't have any more) and here is what you need to do to run this script:
<pre>sudo su
su gitosis
export set GIT_DIR="/srv/gitosis/repositories/gitosis-admin.git"
export set PYTHONPATH="/usr/share/pyshared"
/usr/share/pyshared/gitosis/templates/admin/hooks/post-update</pre>
That is, goto root account with sudo. Change users to gitosis. Set some variables (GIT_DIR, and PYTHONPATH). Then run script. This might give you more insight of to why the gitosis.conf file is not being updated.
<h3>Lost access to gitosis.conf file</h3>
This happened to me. Any commit I made to the gitosis-admin repo resulted in a permissions denied. So I logged on to my server, changed directories over to /srv/gitosis and edited the
<pre>.gitosis.conf</pre>
file and all was okay.
<h3>PERMISSION problems</h3>
Most of the time this was because the files in /srv/gitosis were not group writeable by the group of 'gitosis', or my account did not belong to the group 'gitosis', or that the ssh configuration file did not allow my account to login via ssh.
<h3>conclusion</h3>
Most of the time gitosis worked great. But sometimes, it did not work out. I hope this document will save me in the future as well as others. A really nice resource for gitosis can be found at&nbsp;http://ao2.it/wiki/How_to_setup_a_GIT_server_with_gitosis_and_gitweb
Cheers,
Aaron
