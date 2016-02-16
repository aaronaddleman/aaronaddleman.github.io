---
layout: post
title: "Setting up a Zimbra server"
description: ""
tags: [organization, system]
image:
  feature: 8160227607_ba0919e74a_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<h3>Overview</h3>
Phew! After a long and pain staking process of getting my Zimbra setup, I can finally start logging all of my efforts. My over all goal has been to get Zimbra to replace an existing email service provided by hMailServer. For a while, I liked hMailServer, but it definitely has some features lacking. But when I found Zimbra and started to drool over the screenshots and features, I started to dislike hMailServer. Then after my hMailServer started to croak due to some other reasons, it was time to migrate.
This post coverers the aftermath of migrating from hMailServer to Zimbra setup from the archive being installed on Ubuntu Server 10.04 64 bit and migrating.
<h3>Setup (warning! read all of this section to the end!)</h3>
I decided to go with Ubuntu because it seemed supported and easy to maintain. I had an existing email service hosted by hMailServer program on a Windows Server 2008 using Active Directory for account authentication. So after creating the simple server and installed Openssh-server package, I transferred the Zimbra install file:
<code>
% scp zcs-7.1.0_GA_3140.UBUNTU10_64.20110329151347.tgz myaccount@myserver:zcs-7.1.0_GA_3140.UBUNTU10_64.20110329151347.tgz</code>
Next up is to expand the archive and proceed with installation:
<code>
% tar zxvf zcs-7.1.0_GA_3140.UBUNTU10_64.20110329151347.tgz
% cd zcs-7.1.0_GA_3140.UBUNTU10_64.20110329151347
% sudo ./install.sh</code>
I quickly found out that Zimbra is very picky and needs the following:
<ol>
<li>The server to have a FQDN (fully qualified domain name)</li>
<li>An MX record of the server name (preferred but not required)</li>
</ol>
So I headed over to my internal DNS server and created a records for my new server to make Zimbra happy.
Next up, logging in to Zimbra and configuring the default domain and the new domain.
<h3>Configuring Zimbra</h3>
{to be filled in tomorrow}
Setting the conical name for the Zimbra server
<h3>Importing email boxes</h3>
<div>{to be filled in}</div>
<h3>Tagging accounts in Active Directory with Apache Directory Studio</h3>
<div>{to be fiilled in}</div>
<h3>Importing from hMailServer</h3>
This was a serious pain! After struggling for hours to use the tool from Zimbra (and not getting much feedback from any dialog or log file), I decided to venture out and use the program imapsync. But that had its own problems too. Finally I found my combination of getting mail out of the hMailServer account and into my Zimbra area:
<code></code>
<code>(enable plain text passwords in Zimbra first)</code>
<code>
sudo imapsync --buffersize 8192000 --nosyncacls --subscribe --syncinternaldates --host1 HMAILSERVER.DOMAIN.COM --user1 "hmailserver-account@hmailserver.com" --password1 "hmailserverpassword" --host2 zimbra.domain.com --user2 "zimbra-account@zimbra.domain.com" --password2 "zimbrapassword" --port1 143 --port2 143 --noauthmd5 --debug --authmech2 PLAIN --allowsizemismatch</code>
