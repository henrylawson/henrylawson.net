---
layout: post
title: Deployment Release
date: 2014-10-05
---

A typical practice is to deploy a new version of software the night before the
expected release date of a feature or functionality.

This is problematic because:

1. A deployment causes lots of change in our production environments
1. A new version of our software has code changes that could introduce new bugs
1. The new code has never run in production before and tomorrow our users will
   get exposed to it for the first time
1. If we are deploying this late before a release, we probably have a lot of
   change built up - change is equivalent to risk

<!--more-->

However with all of these points understood, a deployment before a release is
still common practice.

**To avoid all of this risk, it is important to separate the processes and
policies around a Release and a Deployment.**

**A Release** is a primarily business decision (IT is also involved) to make a
new feature or functionality available to customers.

**A Deployment** is a primarily IT decision (Business is also involved) to
update the software and infrastructure in production to address security
concerns, to bring the system to the latest working version or to address
performance issues.

The important note is to **separate the idea of a Release from a Deployment**.
Using [Feature Toggles](http://martinfowler.com/bliki/FeatureToggle.html), a
deployment of the code that provides that feature or functionality can be
deployed well in advance. **The release then becomes the simple activity of
turning on the feature**.
