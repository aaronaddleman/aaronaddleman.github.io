---
layout: post
title: "Modifying the Trac email notification file to show a custom date format"
description: ""
tags: [programming]
image:
  feature: 9553056715_0a418a1852_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


I really like the <a href="http://trac.edgewall.org/">Trac</a> project management software. Recently I have been using it very much and customizing it to fit my needs at work. In regards with the notification system, I found that the default format was not acceptable and a custom one was desired. I added the following code to the file "/usr/lib/python2.4/site-packages/trac/ticket/templates/ticket_notify_email.txt" to have a nice date in the template:

{% raw %}
    {% python
    from genshi.builder import tag
    from trac.util.datefmt import format_datetime
    import time
    def custom_time(value):
    return format_datetime(t=value, format='%H:%M:%S', tzinfo=PST)
    %}
    ${custom_time(ticket.time)}
{% endraw %}

My entire file looks like the following:

{% raw %}
    {% python
    from genshi.builder import tag
    from trac.util.datefmt import format_datetime
    import time
    def custom_time(value):
    return format_datetime(t=value, format='%Y-%m-%d %H:%M:%S', tzinfo=PST)
    %}
    {% choose ticket.new %}\
    {%   when True %}\
    On ${custom_time(ticket.time)} PST, a ticket with the summary of '$ticket.summary' was created by '$ticket.reporter' and assigned to $ticket.owner .
    {%   end %}\
    {%   otherwise %}\
    {%     if changes_body %}\
    ${_('Changes (by %(author)s):', author=change.author)}
    $changes_body
    {%     end %}\
    {%     if changes_descr %}\
    {%       if not changes_body and not change.comment and change.author %}\
    ${_('Description changed by %(author)s:', author=change.author)}
    {%       end %}\
    $changes_descr
    --
    {%     end %}\
    {%     if change.comment %}\
    ${changes_body and _('Comment:') or _('Comment (by %(author)s):', author=change.author)}
    $change.comment
    {%     end %}\
    {%   end %}\
    {% end %}\
    --
    ${_('Ticket URL: &lt;%(link)s&gt;', link=ticket.link)}
    $project.name <${project.url or abs_href()}>;
    $project.descr
{% endraw %}
