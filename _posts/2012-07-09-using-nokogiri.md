---
layout: post
title: "Nokogiri"
description: "I have always defaulted to hpricot for parsing HTML, but today decided to try out Nokogiri. Its really cool! Some of the features are easy to understand and write. I added some examples to help remember how to use them on this article."
tags: [ruby]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Sample Data

    [employees.xml]
    <employees>
      <employee status="active">
        <fullname>Dean Martin</fullname>
      </employee>
      <employee status="inactive">
        <fullname>Jerry Lewis</fullname>
      </employee>
      <employee status="inactive">
        <fullname>Ab Martin</fullname>
      </employee>
    </employees>
    EOXML

## Nokogiri example

{% highlight ruby %}
require 'nokogiri'

f = File.open("employees.xml")
doc = Nokogiri::XML(f)


# navigate!
doc.employees.employee.last.fullname.content # => "Jerry Lewis"

# access node attributes!
doc.employees.employee.first["status"] # => "active"

# use some xpath!
doc.employees.employee("[@status='active']").fullname.content # => "Dean Martin"
doc.employees.employee(:xpath => "@status='active'").fullname.content # => "Dean Martin"

# use some css!
doc.employees.employee("[status='active']").fullname.content # => "Dean Martin"
doc.employees.employee(:css => "[status='active']").fullname.content # => "Dean Martin"

f.close
{% endhighlight %}