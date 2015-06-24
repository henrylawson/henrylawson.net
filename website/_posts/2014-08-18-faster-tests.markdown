---
layout: post
title: Faster Tests
date: 2014-08-18
---

[Feedback]({% post_url 2012-07-29-feedback-cycles %}) is best when it is given
timely and regularly. Our tests are a form of feedback. Below are some methods
I have learnt over the years to speed up tests so that they can give faster
feedback.

<!--more-->
1. **Analyze and measure the bottleneck** just as we do when analyzing a
   production system to identify bottlenecks, apply the same unbiased analysis
on your test suite - try avoid jumping to conclusions such as _it is the DB_,
_it is the WS call_ - usually these are the culprits but sometimes more
analysis reveals interesting problems. Measure the performance before and after
your change so you can be sure you made an improvement.
1. **Is the test needed?** determine if the test is still required, is it
   providing enough value to justify existing. Make sure you understand why it
was written, how it ended up the way it is and what it is really testing - use
the git log, talk to people and have an open mind when asking if it is still
needed - assume the authors had the best of intentions when writing the test.
Try to understand the problem before concluding that deleting it is the best
course of action.
1. **Can it be re-written?** determine whether the test is going about the
   execution of the system in the right way, investigate to see if other
simpler methods of execution and test data setup exist.
1. **Can the test be pushed down to a lower layer** testing a system through
the user interface is always going to be orders of magnitude slower than
testing it through the interactions of classes and modules. Look at the test
scenario and determine if it can be written as a unit or lower level test.
1. **Mock out external dependencies** if the test is talking to a database, web
   service, file system or interacting with another class or module,
investigate to see if that interaction can be replaced with a [Mock or
Stub](http://martinfowler.com/articles/mocksArentStubs.html).
1. **Group multiple assertions** it is typically considered best practice to
   have a single assert per test - in most situations this is fine however when
the test itself is expensive or the scenario is long running, re-executing a
scenario to assert on a different value can be expensive, consider grouping
multiple asserts into one test and use [Aggregated
Failures](http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers%3Aaggregate_failures).
1. **Re-use test data entities** question if each scenario needs their own
   Customer or Employee, if these entities are expensive to create, perhaps a
set of tests can share one? Typically it is best practice to avoid coupling
test data to ensure the result of a test is deterministic, sharing test data
carries state across tests and can result in nondeterministic behaviour as it
is could now be dependent on the order scenarios are executed. When determining
if test data entities can be shared it is best to use entities that don't store
state or data that is immutable.
1. **Bulk setup test data** would aggregating multiple data setup calls into a
   single call to _"Setup test data for Scenario #1"_ be more efficient? When
testing across systems we usually make multiple calls or inserts to a database
to setup data - determine if aggregating those operations into a single
operation will speed things up.

I am using the more general description of "test" here as I believe these
methods can be applied to tests at any level of testing - whether it be unit,
integration, functional or exploratory. Of course, certain methods don't make
sense at some levels - such as mocking when doing integration testing so some
common sense is required.

Also remember that the above methods are optimizations. Avoid prematurely
optimizing your test suite. The primary focus should be to have a test suite
that is valuable, simple, explicit and cheap to maintain. Applying some of
these techniques too early and prematurely optimizing may result in a less
optimal test.
