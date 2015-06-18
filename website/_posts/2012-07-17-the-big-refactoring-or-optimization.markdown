---
layout: post
title:  "The Big Refactoring or Optimization"
date:   2012-07-17 21:00:00
categories: software
---

Every now and then a team will find itself with an architecture that isn't quite right or a system that isn't performing quite as everyone would have hoped so. In these cases the inevitable happens - **The Big Refactoring or Optimization**. Now there is nothing wrong with this, evolving architectures and codebases are a fundamental part of agile software projects. What I'm sharing today are some insights that I gained while recently undertaking this journey with my team:

<!--more-->

*   Having a high [unit test](http://c2.com/cgi/wiki?UnitTest) [coverage]({% post_url 2012-06-01-the-magic-number %}) is a requirement **but it isn't enough**
*   Solid [acceptance and or functional tests](http://www.extremeprogramming.org/rules/functionaltests.html) are a godsend

The biggest learning from this exercise was that even though you might have a high unit level coverage (> 92%) things still manage to sneak through the cracks. **While all those execution paths might be covered, they might not be tested that well**. Furthermore, a good unit test is one that tests itself in isolation of others. The problem then arises that if those isolated unit tests aren't thoroughly testing things at their level, problems don't show themselves until a much higher level - _once everything is integrated_.

To put this point into context, we were doing optimizations around repository calls for entities from the database. The tests for the repository methods probably didn't cover as many scenarios as they should have. After the optimization the tests all passed, _the repository methods were still returning the same information that the tests were expecting_. The problem of course was that they **weren't returning the exact information that they used too**. This resulted in some hard to find bugs popping up on the UI layer that took some time to pin back down to those refactored repository methods.

This is where a good acceptance and or functional test suite can come in handy. I'm not saying that they should be some how testing the right data is coming in and out of the repository but a decent functional test suite will at least fail on one of the flows affected by the refactoring. An investigation into the failure would then lead to the discovery of the fudged refactorings. Unfortunately in our case, we weren't doing [BDD](http://en.wikipedia.org/wiki/Behavior-driven_development) or [ATDD](http://www.methodsandtools.com/archive/archive.php?id=72) and this refactoring was occurring before those tests existed. _It must also be noted that if a functional and or acceptance test does happen to discover one of these bugs its more of a bonus, these cases 	really need to be covered at the unit level._

Another important learning was that these optimizations and refactorings should be done by someone who has context on the code that is being worked on. This is because if those unit tests are not sufficient, at least you are pairing with someone who has a bit of an idea of what that code should be doing.
