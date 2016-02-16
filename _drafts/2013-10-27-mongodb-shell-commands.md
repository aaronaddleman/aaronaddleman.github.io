---
layout: post
title: "MongoDB shell commands"
description: "When using MongoDB sometimes it's nice to drop into the shell interface and practice some of your data before commiting to the logic. When using the shell, here are some examples of how to issue commands. I will warn you this is pretty basic stuff and is ment as a cheat sheet for reference."
tags: [databases]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Basics

### list databases

To view a list of databases, the following command will print out a list for you:

    show databases
        
### list collections in database

    show collections

### create or use a database

To create a new database, issue the following command and when you create a collection and document, the database is created:

    use newdbname

If the database name has periods or dashes, use the following example:

    use db["name-of-database"]

### creating a document with a new collection

After issuing the command to create or use a database, this command will use the database to create a document inside the specified collection:

    db.foo.insert({"bar" : "baz"})

### finding the document

When you want to find the document you made, the following command will help with that:

    db.foo.find({"bar" : "baz"})

### finding the document when the collection has special characters

When your collection has special characters the following command helps find the documents:

    db["foo-bar-zebo"].find()
    db["foo-bar-zebo"].find({"bar" : "baz"})

### removing all documents from a collection

Clearing out all of the documents from a collection can be done with the following:

    db.foo.remove()

## More querying

### Trying to find records with a range

The following query will find any tickets with the value in "725,542,390":

Data set:

    db.raffle.insert({"ticket_no" : 1})
    db.raffle.insert({"ticket_no" : 2})
    db.raffle.insert({"ticket_no" : 3})
    db.raffle.insert({"ticket_no" : 725})
    db.raffle.insert({"ticket_no" : 726})
    db.raffle.insert({"ticket_no" : 554})
    db.raffle.insert({"ticket_no" : 552})
    db.raffle.insert({"ticket_no" : 389})
    db.raffle.insert({"ticket_no" : 390})

Find command:

    db.raffle.find({"ticket_no" : {"$in" : [725,542,390]}})

Returned results:

    { "_id" : ObjectId("52459caeed716415663fa0a1"), "ticket_no" : 725 }
    { "_id" : ObjectId("52459cbded716415663fa0a6"), "ticket_no" : 390 }

Find command:

    db.raffle.find({"ticket_no" : {"$gte" : 418, "$lte" : 700 }})

Returned results:

    { "_id" : ObjectId("52459cb4ed716415663fa0a3"), "ticket_no" : 554 }
    { "_id" : ObjectId("52459cb7ed716415663fa0a4"), "ticket_no" : 552 }

### Trying to find records with a date

The following example shows how to find a record that is less than a date:

Data set:

    > recdate = new Date("01/01/2006")
    ISODate("2006-01-01T08:00:00Z")

    > newuser = {"username" : "bwayne",
    ... "registered" : recdate,
    ... "aka" : "batman"}

    > db.users.insert(newuser)

    > db.users.find()
    { "_id" : ObjectId("5245bf7bed716415663fa0a7"), "username" : "bwayne", "registered" : ISODate("2006-01-01T08:00:00Z"), "aka" : "batman" }
    > db.users.find({"registered" : {"$lt" : start}})
    { "_id" : ObjectId("5245bf7bed716415663fa0a7"), "username" : "bwayne", "registered" : ISODate("2006-01-01T08:00:00Z"), "aka" : "batman" }

    { 
      "startdate" : new Date(), 
      "starturl" : "http://local.frbsf.org",
      "data" : 
                [ 
                  { "url" : "http://staging.frbsf.org/our-district/about/", "md5": "123"},
                  { "url" : "http", "md5": "456"},
                ]    
    }



### Find all records and return a specific field

db["collection"].find( { "url" : { "$exists" : true }}, {url:1} )