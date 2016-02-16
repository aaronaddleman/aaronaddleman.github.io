---
layout: post
title: "using subversion and pre-hooks to prevent unwanted characters in your file names"
description: ""
tags: [uncategorized]
image:
  feature: 11786474283_9f0f30e96c_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>After having developers upload files that contain harmful characters such as blank spaces, ('s and ['s I decided to make a script and put it in the pre-commit hook to stop the files from being submitted. Here is the script. If you have any suggestions as how to accomplish this better, please make your post to this article :D
</p>
<pre lang="LANGUAGE">#!/bin/sh
REPOS=${1}
TXN=${2}
TMP="/tmp/svn.hook.changes.tmp"
SVNLOOK="/usr/local/bin/svnlook"
GREP="/usr/bin/grep"
# check for files with weird characters
LINES=`$SVNLOOK changed -t ${TXN} ${REPOS} | colrm 1 4 | grep -c '[\ |\(|\)]' `
if [ $LINES -eq "0" ]; then
# All checks passed, so allow the commit.
exit 0
else
# All checks did not pass
echo "" &gt;&amp;2
echo "!!!Your file(s) contain bad characters!!!" &gt;&amp;2
echo "We only need characters between A-Z or a-z or 0-9 or _" &gt;&amp;2
echo "" &gt;&amp;2 
# Show the actual paths:
${SVNLOOK} changed -t ${TXN} ${REPOS} | grep '[\ |\(|\)]' | cut -c5- &gt;&amp;2
echo "" &gt;&amp;2 
# cancel commit
exit 1
fi</pre>
