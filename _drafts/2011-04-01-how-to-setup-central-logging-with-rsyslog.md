---
layout: post
title: "How to setup central logging with rsyslog"
description: ""
tags: [system]
image:
  feature: DSC03476.JPG
  credit: Aaron Addleman
comments: true
share: true
---


## Overview

After looking around for many howto on using rsyslog to capture log entries from a client to a central logger, I wanted to document my simple configuration for myself. What follows is a simple step list of two computers (AppServer and a LogServer) both running Ubuntu and logging to MySQL database. My reason for logging to MySQL is for later running of LogAnalyzer.

## The Setup of the rsyslog server

First install rsyslog and get it logging to your local MySQL database for verification of rules being handled correctly. For Ubuntu 10.10 you can use the following command to get your packages installed:

{% highlight bash %}
    sudo aptitude install rsyslog-mysql
{% endhighlight %}

Disable your stock syslogd from your /etc/rc.* directories. Incase the MySQL tables are not installed you can building them from:

{% highlight sql %}
    CREATE DATABASE Syslog;
    USE Syslog;
    CREATE TABLE SystemEvents
    (
    ID int unsigned not null auto_increment primary key,
    CustomerID bigint,
    ReceivedAt datetime NULL,
    DeviceReportedTime datetime NULL,
    Facility smallint NULL,
    Priority smallint NULL,
    FromHost varchar(60) NULL,
    Message text,
    NTSeverity int NULL,
    Importance int NULL,
    EventSource varchar(60),
    EventUser varchar(60) NULL,
    EventCategory int NULL,
    EventID int NULL,
    EventBinaryData text NULL,
    MaxAvailable int NULL,
    CurrUsage int NULL,
    MinUsage int NULL,
    MaxUsage int NULL,
    InfoUnitID int NULL ,
    SysLogTag varchar(60),
    EventLogType varchar(60),
    GenericFileName VarChar(60),
    SystemID int NULL
    );

    CREATE TABLE SystemEventsProperties
    (
    ID int unsigned not null auto_increment primary key,
    SystemEventID int NULL ,
    ParamName varchar(255) NULL ,
    ParamValue text NULL
    );
{% endhighlight %}

## Editing the rsyslog.conf file

To get rsyslog up and running most of our edits are in the rsyslog.conf file. Grant some access on the database called Syslog and keep the details for later steps. Enable the output module in your rsyslog.conf file:

{% highlight bash %}
    $ModLoad ommysql # load MySQL mod
    $ModLoad imtcp # needs to be done just once
    $InputTCPMaxSessions 500
    $InputTCPServerRun 514 # where rsyslog listens
    local0.* :ommysql:your-database-server,database-name,your-database-userid,your-database-password # rsyslog database access
{% endhighlight %}


Restart rsyslog, do something that will generate a log (I usually go with using ssh to the local host and typing in a bad password). Go back to your MySQL database and check the log entries are being shown in your table.

Login to MySQL:

{% highlight bash %}
    mysql -u user -p
{% endhighlight %}

Then run your sql statement to find the records:

{% highlight sql %}
    use Syslog;
    SELECT * from SystemEvents\G
{% endhighlight %}

## Setting up a remote client for logging to the rsyslog server

Repeat the same steps for the server and make sure that rsyslog is working correctly. Create a directory for rsyslog to use when the rsyslog server is unavailable (I choose /var/spool/rsyslog-work). Then add the following to your rsyslog.conf file:

{% highlight bash %}
    # Forward all logs to central logger
    $WorkDirectory /var/spool/rsyslog-work # default location for work (spool) files
    $ActionQueueType LinkedList # use asynchronous processing
    $ActionQueueFileName srvrfwd # set file name, also enables disk mode
    $ActionResumeRetryCount -1 # infinite retries on insert failure
    $ActionQueueSaveOnShutdown on # save in-memory data if rsyslog shuts down
    #
    ### pick one of the two methods listed
    *.* @@rsyslog.server.net #tcp
    *.* @rsyslog.server.net #udp
{% endhighlight %}

Restart the rsyslog service. Test that you can reach the rsyslog server on port 514 by using telnet (or some other method you prefer). You should be good to go!

## Debugging

In case you run into troubles, I have had some good information provided back to me by launching rsyslogd with the debugging command:

{% highlight bash %}
    rsyslogd -d
{% endhighlight %}

This has helped find out problems when trying to see where any problems are in regards to rsyslogd. Just recently, I noticed a problem where rsyslogd could not establish a port. After using some google queries I found out that sometimes there is a problem with rsyslogd using dropping down to a user from the root account. I disabled the feature to drop down to a user account and the debug print out showed that rsyslogd established the port.
