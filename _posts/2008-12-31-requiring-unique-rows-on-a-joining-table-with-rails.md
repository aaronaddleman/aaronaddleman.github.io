---
layout: post
title: "requiring unique rows on a joining table with rails"
description: ""
tags: [programming]
image:
  feature: 8160227607_ba0919e74a_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---


<p>Having figured this problem in rails all by myself made me so happy that I wanted to write it down and not let myself forget.
</p>
<h2>Problem</h2>
I have a One-to-Many table relationship and the many table needs to have each record have a different value for the field of "letter" for parent row created.
<h2>Solution</h2>
By using the validates_uniqueness_of in the model of the child table and defining the scope. The validation will limit the check of an existing row to a smaller range.
<h2>Example</h2>
<span style="font-family: terminal,monaco;">validates_uniqueness_of :letter, :scope =&gt; :parent_field_id</span>
<h2>Going Further</h2>
I had another problem that required the use of validates_uniqueness_of but it required checking a value for a field that had a true/false value. I needed to have many rows exist with the field being false, but onle one row contain true. The following validation works very good for this situation:
<span style="font-family: terminal,monaco;">validates_uniqueness_of :is_correct, :scope =&gt; :parent_column_id, :if =&gt; Proc.new { |answer| answer.is_correct }</span>
The scope limits the validation of the child row to be localized for the parent record <strong>only</strong> when the :if statement executes the block contains the "is_correct" field.
What I like about this statement is that the if block can be any type of check you want. For example if you want to check on a different field than the one you are deciding is unique on.
<h2>Closing</h2>
Please be aware this is the only way I know how to accomplish this task. If you have any suggestions on how to accomplish what I described above please add your comments below.
