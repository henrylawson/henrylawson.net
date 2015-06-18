---
layout: post
title:  "Programmers Workflow"
date:   2012-07-29 21:00:00
categories: software
---

When pairing with other people I always find it interesting to see what their programming workflow is like. Most people I know [TDD](http://www.amazon.com/Test-Driven-Development-By-Example/dp/0321146530) out their code and like to follow some form of the _Boy Scout Rule_:

<!--more-->

**You should always leave the campground cleaner than you found it** - [Robert C. Martin](http://www.objectmentor.com/omTeam/martin_r.html) ([quoted in the context of programming](http://www.infoq.com/presentations/Robert-C.-Martin-Bad-Code))

When this common _Boy Scout Rule_ is applied to computer programming, the camp ground becomes your code base and cleanness typically refers to the traits that [Bob Martin](http://www.objectmentor.com/omTeam/martin_r.html) talks about in his book [Clean Code](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882). That is, code that does not violate [YAGNI](http://c2.com/cgi/wiki?YouArentGonnaNeedIt), [KISS](http://catb.org/jargon/html/K/KISS-Principle.html), is well [refactored](http://c2.com/cgi/wiki?WhatIsRefactoring), pleasant to read and easy to understand. When working on an existing code base it doesn't take long to find an area of the code that could be improved, following the _Boy Scout Rule_ means that it is now your responsibility to leave the "camp ground" cleaner then you found it. So it is time to roll up your sleeves and refactor the existing code until it is clean.

The extreme flip side of this are people who don't follow the _Boy Scout Rule_ at all and simply dive into the code base and make whatever changes are needed to get the job done _and walk away_. The side affect of this carelessness is a code base with a high [technical debt](http://martinfowler.com/bliki/TechnicalDebt.html) and _a lot of angry coworkers_. **The strict application of the _Boy Scout Rule_ results in the continual improvement in the quality of the code base at every commit**. This is because everyone is doing their bit to improve every piece of code that they come across.

What I find interesting when pairing is when people decide to do their cleanup. Do you do it at the end of the task you were starting? Or do you do it at the end? I once read somewhere (can't remember where) that [Kent Beck](http://www.threeriversinstitute.org/blog/) and [Martin Fowler](http://martinfowler.com/) like to keep a list of cleanups or debts that they discover while they are developing a story. They prefer to keep them on a list, and only refactor what is needed to get their functionality working. Once the functionality is done, then it is a good time to start refactoring that solution into something nicer. Of course, sometimes you can't even start your story until some heavy refactoring is done. So this, like all rules, can not be applied everywhere blindly. Previously, I use to prefer to refactor the code as soon as I found a problem with it. What I found is that I would spend an inordinate amount of time cleaning up code that wasn't contributing directly to the new piece of functionality I as working on. So instead, I've tried to find balance by setting a few rules:

1.  Only clean up existing code before completing the functionality if it will help with understanding and if it is low in risk and effort
2.  Only clean up existing code before competing functionality if it is really required before the functionality can be implemented well
3.  Leave all large potentially risky refactorings until after the commit for the new functionality has been completed
4.  **Never perform a clean up on existing code with a working base that has uncommitted changes**
5.  Draw a strict boundary of where the camp ground ends, mark and leave those messy areas for another day

Following these set of rules, I've been able to find a suitable balance between working effectively and efficiently and not loosing sleep over leaving behind a dirty camp ground.
