---
layout: post
title: "Ubuntu authenticate against Active Directory with limited access"
description: ""
tags: [uncategorized]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>This is why I like Ubuntu so much. Here are my steps on how to allow Ubuntu authenticate against a Windows Active Directory:
</p>
<ol>
<li>sudo apt-get install libpam-ldap libnss-ldap libpam-cracklib</li>
<li>before answering questions, setup a proxy account in your AD to only have rights for checking authentication (basic read-only access to the AD)</li>
<li>answer all questions prompted on your Ubuntu</li>
<li>when you are prompted for a bind account, use the account you created in step #2</li>
<li>create a local account that will be using the AD for authentication making sure the user name is the same</li>
<li>remove the password in the /etc/shadow file and replace it with a "*"</li>
<li>in the account you want to authenticate, make sure the unix attributes have the user and group numbers set to the same account on your Ubuntu server</li>
<li>on the Ubunto /etc/passwd file, make sure the UID and GID are the same as the AD Unix Attributes</li>
</ol>
Now try ssh'ing to your Ubuntu and you should be set to go!
