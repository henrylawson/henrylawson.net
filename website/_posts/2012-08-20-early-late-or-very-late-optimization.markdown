---
layout: post
title:  "Early, Late or Very Late Optimization"
date:   2012-08-20 21:00:00
categories: software
---

Optimization is a topic that is guaranteed to come up at least once during the course of a project or even perhaps once an iteration, or once every story if your project is performance critical. When working in an agile [TDD](http://c2.com/cgi/wiki?TestDrivenDevelopment) environment the following questions often arise - **Do we optimize from the beginning? Do we optimize at the end? Is this optimization something that comes under [KISS and YAGNI](http://www.codinghorror.com/blog/2004/10/kiss-and-yagni.html)?** Unfortunately like almost everything, there is never one perfect answer and it always comes down to context and requirements.

<!--more-->

From my perspective there are three opportunities for optimization during agile TDD style development, these are appropriately named:

1.  Early Optimization
2.  Late Optimization
3.  Very Late Optimization

**Early Optimization** is when it is known before the story begins that there are several [NFR](http://en.wikipedia.org/wiki/Non-functional_requirement)'s related to this story in regards to performance. These usually exist because the story is part of a re-write of a legacy application or it is a story that was created to improve the performance of existing functionality. 

In these situations those **NFR's should be turned into acceptance tests that can be run continuously during development** to guide and ensure a well optimized solution is created that satisfies the NFR's. The important point to note about the two examples provided above is that there is evidence that _Early Optimization_ is required. This is either by looking at historical data (from the legacy application) or from the measured performance of existing functionality. 

If the project is [greenfield](http://en.wikipedia.org/wiki/Greenfield_project) and performance requirements have been thought up by over optimistic clients or developers about the usage of particular features in the application, then it might be worth considering a _Late Optimization_ or a _Very Late Optimization_ approach instead.

**Late Optimization** is the approach that should be taken **for stories that don't have any concrete supporting evidence that optimization is required**. _Late Optimization_ is the process in which a solution to the problem is first created without optimization being considered. The simplest cleanest solution is created ([KISS](http://en.wikipedia.org/wiki/KISS_principle)). Once this solution has passed QA and has met all functional requirements, then optimization can be considered. 

Before optimizing it is important that the functionality is first measured for its existing performance benchmarks. [Eric Ries] (http://en.wikipedia.org/wiki/Eric_Ries), call's this the "Last Responsible Momement Optimization" in his book the [Lean Startup] (http://theleanstartup.com/), he says that _no optimization should be carried out until a validated learning indicates it is needed_. [Robert C. Martin] (http://en.wikipedia.org/wiki/Robert_Cecil_Martin) goes further in his book [Agile Software Development, Principles, Patterns and Practices] (http://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445) and says that _"If you fear performance may be a problem, I recommend that you conduct some experiments to prove that it will be a problem, Once proven, and only once proven, you should start considering how to speed things up"_. 

Validation that it is needed can be done using tools like [JMeter](http://jmeter.apache.org/), [Gatling](http://gatling-tool.org/) and [Apache Benchmark](http://httpd.apache.org/docs/2.2/programs/ab.html). Once the functionality has been benchmarked, **if the results indicate that the performance does not meet a business need, then optimization should be carried out** (_after a new optimization story is created, estimated and prioritized)_. The important thing to reiterate here is that the evidence was obtained to prove that performance was a problem that affected a business need, thus justifying the extra work and avoiding a violation of [YAGNI](http://en.wikipedia.org/wiki/You_ain). 

It should go without saying that as with _Early Optimization_, the new NFR's should be written as acceptance tests prior to development. Now it might seem like a lot of fluffing around is being carried out for something that needed to be optimized from the beginning. However, it is surprising how often the [KISS](http://en.wikipedia.org/wiki/KISS_principle) solution to a problem is _more then good enough to satisfy a business need_. For the cases where there is too much uncertainty about whether something should be optimized, there is always _Very Late Optimization_.

**Very Late Optimization** is optimization carried out on a piece of functionality after it has been released into the wild and found to not meet the performance requirements of its users. Optimization can be a very expensive operation in some circumstances, in these situations concrete evidence is required. The most indisputable form of evidence is that which is captured from real users of the application. This might seem like a failure to some people - releasing an application that fails to meet its user's performance needs. However the accumulative cost of consistently optimizing functionality too early without concrete supporting evidence - **often results in bloated, untimely development of functionality and overly complex, expensive to maintain solutions**. Remember, a slightly slow system is still a usable one and if the team is doing [Continuous Delivery](http://martinfowler.com/books/continuousDelivery.html) (which they should be), the performance issue can be addressed in the next push.

Furthermore, the impact of these **Very Late Optimizations** can be reduced by using feature toggles and the staggering the release of feature across a user base. For example, if capacity may be a problem, **consider releasing to just a segment of the user base**, measure the results and then determine if their is enough caapacity to support the entire user base, if not. Consider optimization as a solution.
