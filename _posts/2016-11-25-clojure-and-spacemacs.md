---
layout: post2
title: "Clojure and Spacemacs"
description: "How to use Clojure and Spacemacs together"
tags: [emacs]
image:
  feature: https://c6.staticflickr.com/6/5502/30441913661_b19df3bbe9_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Errors I have found

### Unable to resolve var: refactor-nrepl.middleware/wrap-refactor

While trying to start a REPL in Spacemacs, I found the following error:

```
Error loading refactor-nrepl.middleware: java.lang.RuntimeException: No such var: cljs/requires-piggieback, compiling:(refactor_nrepl/middleware.clj:139:2)
Exception in thread "main" java.lang.RuntimeException: Unable to resolve var: refactor-nrepl.middleware/wrap-refactor in this context, compiling:(/private/var/folders/ck/j27j2pqn2_d185myfb7wh7z00000gn/T/form-init7123667850855882904.clj:1:5940)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6875)
	at clojure.lang.Compiler.analyze(Compiler.java:6669)
	at clojure.lang.Compiler.analyze(Compiler.java:6625)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3834)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6870)
	at clojure.lang.Compiler.analyze(Compiler.java:6669)
	at clojure.lang.Compiler.analyze(Compiler.java:6625)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3834)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6870)
	at clojure.lang.Compiler.analyze(Compiler.java:6669)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$LetExpr$Parser.parse(Compiler.java:6269)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6868)
	at clojure.lang.Compiler.analyze(Compiler.java:6669)
	at clojure.lang.Compiler.analyze(Compiler.java:6625)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6001)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5380)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:3972)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6866)
	at clojure.lang.Compiler.analyze(Compiler.java:6669)
	at clojure.lang.Compiler.eval(Compiler.java:6924)
	at clojure.lang.Compiler.eval(Compiler.java:6917)
	at clojure.lang.Compiler.load(Compiler.java:7379)
	at clojure.lang.Compiler.loadFile(Compiler.java:7317)
	at clojure.main$load_script.invokeStatic(main.clj:275)
	at clojure.main$init_opt.invokeStatic(main.clj:277)
	at clojure.main$init_opt.invoke(main.clj:277)
	at clojure.main$initialize.invokeStatic(main.clj:308)
	at clojure.main$null_opt.invokeStatic(main.clj:342)
	at clojure.main$null_opt.invoke(main.clj:339)
	at clojure.main$main.invokeStatic(main.clj:421)
	at clojure.main$main.doInvoke(main.clj:384)
	at clojure.lang.RestFn.invoke(RestFn.java:421)
	at clojure.lang.Var.invoke(Var.java:383)
	at clojure.lang.AFn.applyToHelper(AFn.java:156)
	at clojure.lang.Var.applyTo(Var.java:700)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve var: refactor-nrepl.middleware/wrap-refactor in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler$TheVarExpr$Parser.parse(Compiler.java:710)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6868)
	... 36 more
Subprocess failed
```

Upon searching the interwebs, I found a [github issue](https://github.com/clojure-emacs/refactor-nrepl/issues/110) which suggested putting the following in the `project.clj` file:

```clojure
  :plugins [[refactor-nrepl "1.1.0"]
            [cider/cider-nrepl "0.9.1"]]
```

## Starting a REPL

```
M-x cider-jack-in
```

