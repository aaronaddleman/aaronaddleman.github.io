---
layout: post
title: "Looping through multiple select list box items in a Microsoft Access form and inserting the values into a table using VBA"
description: ""
tags: [programming]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
---


## The Setup

You have two multi select list boxes and you want to insert their combined values into a table. Here is an example:

* List box 1
 * birds
 * trees
 * frogs
* List box 2
 * type a
 * type b

When you select "birds, trees" and "type a" the following select statements will be executed:

{% highlight sql %}
    INSERT INTO tableA (name, value) VALUES ("birds", "type a")
    INSERT INTO tableA (name, value) VALUES ("trees", "type a")
{% endhighlight %}

Here is the following VBA Script to do the above:

{% highlight VbNet %}
    Private Sub Command4_Click()
      Dim varRoles As Variant
      Dim varRole As String
      Dim varUserNames As Variant
      Dim varUserName As String

      Dim strSQL As String

      For Each varRoles In Me.Role.ItemsSelected
      'MsgBox "we got one role!"
      varRole = Me.Role.ItemData(varRoles)

      For Each varUserNames In Me.UserName.ItemsSelected
      varUserName = Me.UserName.ItemData(varUserNames)
      'MsgBox "we got username: " &amp; varUserName &amp; ", mapped to role: " &amp; varRole

      'execute statement
      CurrentDb.Execute "INSERT INTO jointable (names, roles) VALUES ('" &amp; varUserName &amp; "', '" &amp; varRole &amp; "')"
      Next varUserNames
      Next varRoles
    End Sub
{% endhighlight %}