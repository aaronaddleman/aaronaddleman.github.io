---
layout: post
title: "bash script template to be used for parsing arguments to make your shell programming life easier"
description: ""
tags: [cli, scripts]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I found that all my bash scripts really benefit with the following template because:

* it handles options with possible responses of needs
* debugging with a flag
* help description of the script

This template keeps proving to be enough to start my script building. There is really nothing more to say about this so here is my template:

{% highlight bash %}
    #!/usr/bin/env bash
    # created at: Wed Apr 04 10:03:41 PDT 2009
    # updated at: Wed Apr 22 15:33:24 PDT 2009
    # author: aaron addleman

    # manage subversion with swatch and ftp log file. all actions will be sent to a file for throttling purposes to allow SVN to handle its own lock files
    #
    # BEGIN SCRIPT

    usage()
    {
    cat << EOF
    usage: $0 options
    This script takes commands from a swatch and converts to svn commands for a directory under version control.
      OPTIONS:
    -h      Show this message
    -a      Action needed (STOR, DELE, MKD, ENTRIES, SVNUPDATE)
    -u      Username to use for commits
    -f      File or directory being affected
    -m      message to use
    -x      Execute SVN commands from the $SVNACTIONS file
    (when this option is used, all others are ignored)
    -v      Verbose (boolean)
    -t      Test (dont run any commands, but print them to the command line)
EOF
    }

    ACTION=
    USER=
    FILE=
    MESSAGE=
    VERBOSE=
    TEST=

    while getopts "h a:u:f:m:x:v:t" OPTION
    do
      case $OPTION in
        h)
          usage
          exit 1
        ;;
        a)
          ACTION=$OPTARG
        ;;
        u)
          USER=$OPTARG
        ;;
        f)
          FILE=$OPTARG
        ;;
        m)
          MESSAGE=$OPTARG
        ;;
        v)
          VERBOSE=1
        ;;
        t)
          TEST=1
        ;;
        ?)
          usage
          exit
        ;;
      esac
    done
{% endhighlight %}
