---
layout: post
title: Late Integration
date: 2014-06-17
---

A common project smell during delivery is **Late Integration**. The anti
pattern of bringing all the parts together at the end and testing together
weeks or days before the project is due to complete.

<!--more-->

This typically occurs when the development is carried out by separate teams or
vendors. When the term integration is used, it can refer to:

1. Web Service Integration (SOAP, REST)
1. Flat File Integration (Batch jobs, CSV files)
1. Legacy Database Integration (Sync scripts)

**Late Integration is a problem as it usually results in the last minute
discovery of valuable information. The learning's that are gained from
integrating at the end of the project are often deprioritized in favour of
fixing critical defects before go-live. This usually results in a sub optimal
integration between two systems.**

The alternative to **Late Integration**, is **Early Integration**. Sounds
obvious but to make it happen, the below actions can be taken:

1. Collaborate early on interface designs with external teams
1. Consider [Consumer Driven
   Contracts](http://martinfowler.com/articles/consumerDrivenContracts.html) to
communicate expectations
1. Write stories that slice your application across functional layers and don't
   sign off features until integration is complete
1. Rotate team members into teams that you are integrating with, let them build
   context on that system to ease with integration
1. Encourage functional testing in an integrated environment across interfaces,
   invest in this early in the project

Integrating Late is a common trap to fall into as at the time it looks like
the easiest way forward. The lesson is to invest a little upfront in making it
happen earlier to reap the benefits later down the line.
