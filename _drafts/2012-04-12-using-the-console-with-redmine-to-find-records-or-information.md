---
layout: post
title: "Using the console with RedMine to find records or information"
description: "Console with RedMine and finding records"
tags: [redmine]
image:
  feature: 8160262794_3ba58b187f_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


Some features of RedMine are not available for doing reporting. So I started to dig into the console interface and ran some of my own queries:

## Starting the RedMine console

To start the RedMine console, change directories to your application base:

{% highlight bash %}
cd /usr/share/redmine-1.2
{% endhighlight %}

Now run the following command to get into the console:

{% highlight bash %}
RAILS_ENV=production ./script/console
{% endhighlight %}

This will get you into the Production side of your environment. If you want to use development area:

{% highlight bash %}
RAILS_ENV=development ./script/console
{% endhighlight %}

## Running some queries

### Find all issues by their description only

{% highlight ruby %}
Issue.find(:all, :conditions =&gt; "description LIKE '%your_pattern%'")
{% endhighlight %}

### Find all issues by their description only limited by project id

{% highlight ruby %}
Issue.find(:all, :conditions =&gt; "description LIKE '%your_pattern%' AND project_id = '5'")
{% endhighlight %}

## Find spent hours by looking for a custom value in a issue

{% highlight ruby %}
hours = []
CustomValue.find(:all, :conditions =&gt; "custom_field_id = 35 AND value LIKE '%your_pattern%'").each do |c|
hours << Issue.find(c.customized_id).spent_hours
end
{% endhighlight %}

## Find all issues that a specific user has commented on

{% highlight ruby %}
user_id = []
Project.find(5).issues.each do |issue|
  issue.journals.each do |journal|
  if journal.user_id == 2
    user_id << issue.id
  end
end
{% endhighlight %}

## Find list of users who contributed to an issue for a specific project

{% highlight ruby %}
results = Hash.new
Project.find(5).issues.find(:all).each do |issue|
  people = []
  issue.journals.each do |j|
    people << user
  end
  results["#{issue}"] = people unless people.empty?
end
y results
{% endhighlight %}
