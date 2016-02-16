---
layout: post
title: "Redmine hide assigned to field with role permissions plugin"
description: ""
tags: [redmine]
image:
  feature: 8160263904_6dd8c8e420_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


## General

I really like the program called [Redmine](http://www.redmine.org/) but there was one small feature that I wanted to add which was to hide the "assigned to" field for specific roles (even better, assign a specific role to hide or show the "assigned to" field is my over all plan). So I set out to make a plugin for RedMine. After reading [their documentation on how to make a plugin](http://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial), I noticed that I can override some views of the Ruby on Rails application. To explain what my plugin does, please read further, or you can jump right in to [download extend permissions](/attachments/redmine_extend_permissions.zip) plugin.

## Scope

Limit the viewing of the field "Assigned To" for users. It would be ideal to have this option be custom for each project for the open source software web project management tool named Redmine.

## Solution
Create a plugin to override a the _attributes.rhtml file with a logic operation to check if current user has the role for allowing to view the "Assigned To" field.

## Explanation of installing plugin

[Download the plugin](/attachments/redmine_extend_permissions.zip) and unzip to the `{Redmine Dir}/vender/plugins/` directory. You should end up with the full path of `{Redmine Dir}/vender/plugins/redmine_extend_permissions`. Restart your Redmine application by updating the date stamp on `{Redmine Dir}/tmp/restart.txt`. This is accomplished by using `touch {Redmine Dir}/tmp/restart.txt`. Visit your Redmine application and goto the Plugins page. Hopefully you will see something like the screenshot below:

After verifying the plugin has been loaded you should be able to view the new permissions field by going to your roles and permissions section and editing a role. In the permissions section look for a check box called "View Assigned To" (refer to the screenshot on the left for an example of what my view looked like). This permission will toggle the viewing of the "Assigned To" field. If it is checked on, then members of this role can see the field. If it is checked off, then members should not be able to see the field. Any administrative accounts will see the field regardless of the option.

I suggest making a separate role called "View Assigned To" and check the option for viewing the "Assigned To" field. This allows for very flexible combinations of your members and projects.

Adding a member to the new role with the option will allow you to control visibility of the field.

## Update: Java script error messages have been fixed

I have fixed the javascript errors and will be uploading my new code up today.

## Update: Here is the github repository for the plugin

The github [redmine_extend_permissions](https://github.com/9thport/redmine_extend_permissions) repository should have the fixes and is compatible with Redmine-1.2
