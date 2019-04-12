---
title: clojure
layout: learning
---

## Leinigen

All of the templates:

https://gist.github.com/anonymous/c796cc57f4d078ca7176

## Data types

Data types in clojure

### Numbers

```
(type 1) // java.lang.Long
(type 1.1) // java.lang.Double
```

### Strings and booleans

```
(type true) // java.lang.Boolean
(type "Hello") // java.lang.String
(type (keyword "a")) // clojure.lang.Keyword
(type :a) // clojure.lang.Keyword
```

### Keywords and symbols

```
Symbols are evaluable by the interpeter
(type (quote a)) // clojure.lang.Symbol
Shorthand of a quote:
(type 'a) // clojure.lang.Symbol
```

### Collection types

Lists, Vectors, Maps, Sets

Tip: Clojre will automatically convert a list of array-maps to hash-maps when reaching a certain size.
```
Lists - a linked list data structure
(type '(1 2 3)) // clojure.lang.PersistantList - has better performance if taking items off the head of the list

Vectors - more like arrays (vectors have better performance getting an index)
(type (vector 1 2 3)) // clojure.lang.PersistantVector
(nth (vector 1 2 3) 2) // 3
(last (list 1 2 3)) // 3

Maps
(:a 1 :b 1 :c 1) // {:a 1, :b 1, :c 1}

Sets
(type #{1 2 3 4}) // clojure.lang.PersistentHashSet
```

## Variables and Control flow

### How to define variables

```
(def x "Hello Clojure")
(let [x "Steve"]
   (print "Hello, " x))
(str x) // "Hello Clojure"
```

### Control flow
```
(def x "Hello")

(if (empty? x)
  "X is empty"
  "X is not empty")
 ```

Do is usually used for printing to a console or logging. Not used in other places.

 ``` 
(if (empty?) x)
  nil
  (do
    (println "Ok")
    :ok))
```

```
if-not (empty? x)
   (do 
     (println "Ok")
     :ok))
```

```
(when-not (empty? x)
   (println "Ok")
   :ok)
```

### Switches

Pass pairs of comparisons of predicates. Optionally, a final value is passed if nothing matches.

```
(def x "Hello")

(case x
  "Goodbye" :goodbye
  "Hello" :hello
  :nothing)
  
(cond
  (= x "Goodbye") :goodbye)
  (= (reverse x) "olleH") :olleH
  (otherwise :nothing) :nothing
```
