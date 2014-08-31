---
layout: post
title: "automatically archiving Lotus Notes email with windows vbs script"
description: ""
tags: [windows, mail]
image:
  feature: IMG_0613.JPG
  credit: Aaron Addleman
comments: true
share: true
---


<p>So I have come to a love/hate relationship with Lotus Notes. While I really enjoy the robustness of the application with its idea of making everything a database, I do hate the features it majority lacks. One in particular is the fact of, no, archive, management. So I have devised my own solution until I find another one that makes more sense. I have made this script to roll the archive file that Lotus Notes makes and rename the file to YYYYMMDD of when the script was executed.
So, here is the script:
</p>
<pre lang="vbs">'VBScript that renames a log file with the current date
Dim StrSource, StrNew, fso, sf, systime
StrSource="H:\path\of\archive.nsf"
Set fso = CreateObject("Scripting.FileSystemObject")
set sf=fso.GetFile(StrSource)
systime=now()
'You can skip either of the procedures below
'Call Comment(sf) 'Add a timestamp at the end of the source file
Call RenameFile(sf) 'Rename the source file with the date format of
yyyymmdd.log
Sub Comment(f)
Dim ts
Const ForAppending = 8
set ts=f.OpenAsTextStream(ForAppending)
ts.writeline cstr(systime)
ts.close
End Sub
Sub RenameFile(f)
StrNew=f.ParentFolder &amp;"\" &amp; cstr(year(systime)) &amp; cstr(month(systime)) &amp;
cstr(day(systime)) &amp; "-archive.nfs"
f.move StrNew
End Sub
Save this text into a .VBS file and setup the schedule in the Schedule program found under Programs-&gt;Accessories-&gt;System Tools-&gt;Scheduled Tasks
</pre>
I set mine up to run on the first Wednesday of every month. So to put this all into an example, on 2008 June 6th, the archive.nsf file will be moved to "20080628-archive.nsf" file.
