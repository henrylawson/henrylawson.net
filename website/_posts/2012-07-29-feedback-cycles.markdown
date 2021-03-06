---
layout: post
title:  "Feedback Cycles"
date:   2012-07-29 21:00:00
categories: software
---

One of the greatest benefits of the agile software methodology is that it
reduces the feedback cycle. At a macro level this happens in the form of
iterations. Weekly or biweekly cycles of work that gather formal feedback from
the client on the work completed to date. These reduced feedback cycles are
then taken another level further through their use in Continuous Integration
build pipelines. As part of the build pipeline faster tests are run earlier to
give instant feedback when a defect is found in the software system's build.
This early feedback from the Continuous Integration system allows corrections
to be made sooner, closer to when the problem was introduced and when the team
has the most context on the problem area.

<!--more-->

This mantra is then continued further in [Continuous
Delivery](http://continuousdelivery.com/). One of the points [Jez
Humble](http://jezhumble.net/) and [Dave
Farley](http://continuousdelivery.com/about/) raise in [their book](http://amzn.to/2exBiFN)
is that **if something is painful to do, do it early and do it often**. Doing
it early and doing it often is a direct approach to reducing the feedback cycle
and getting feedback earlier. By deploying to production earlier and often,
even if it is a fake production environment, allows you to refine the process
as your failures happen sooner and probably more often. **Eventually, after
continuous refinement, the process will have been tested a large number of
times and had all defects ironed out**.

**Reducing the feedback cycle is a great way to tackle a difficult problem**.
When working in an environment where expectations are constantly changing and
there are a large number of stakeholders with differing opinions. Most problems
in this situation can be solved by reducing the cycle time between when
feedback is obtained. This doesn't mean that you will instantly produce
flawless results on the first showcase because you've given yourself less time,
it simply means that those **incorrect approaches can be corrected earlier when
changing direction is easier and people are more comfortable with throwing away
all the work they have done and starting again**.

This mantra of reducing cycle times is taken to a micro level through tools
such as [Continuous Tests](http://continuoustests.com/) and custom setups with
[Guard](https://github.com/guard/guard-test). These setups provide feedback to
the developer every time they save the file. Informing them that the changes to
the code they have made have either made the tests pass or made a few others
fail.
