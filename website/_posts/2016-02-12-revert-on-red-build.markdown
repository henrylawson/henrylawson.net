---
layout: post
title: Revert on Red Build
date: 2016-02-12
---

A typical action when working in [Trunk Based
Development](http://paulhammant.com/2013/04/05/what-is-trunk-based-development/)
is to revert a commit that caused a red build. Sometimes this is the appropriate
action to take.  Sometimes it is not. This article provides some learning's and
discussion points to consider before mandating that all commits that caused a
red build should be reverted.

<!--more-->

A revert may not be appropriate when:

1. It is a simple fix to address the problem, time to do the fix and push is
   less than the time to revert and push.
1. Database migrations have been run in a higher level testing environment and
   it may require manual effort to undo the migrations.
1. Multiple commits have bunched up together from various pairs and apps and
   have failed together in automation, reverting your change may introduce
   another issue, reverting everyone's changes to the last green could have
   more adverse impacts and is a bigger/riskier commit.
1. The issue is not related to your commit, it could be environment related and
   reverting will not resolve it.
1. There were multiple commits in different repositories and reverting will
   mean coordinating a revert across all of them.
1. It may be an issue only reproducible in a deployed environment, it might not
   be possible to reproduce the failure locally that you are seeing in the
   deployed environment.
1. When a pair immediately reverts their commit when they see the build has
   broken, they loose the opportunity to debug and understand why that failure
   has occurred. I have been on teams where a pair spent half a day reverting
   commits, attempting to stabilize the build and get it back to green not
   realizing that it wasn't their commits that broke the build in the first
   place, by having the knee jerk reaction to "Revert on Red" they didn't take
   the time to debug and understand what actually happened.

Before mandating that all red builds should result in commits being reverted,
it is important to consider the above points.

One size doesn't always fit all, sometimes it is best to trust the pair to make
the best decision with the information they have at hand to remedy the broken
build. No one likes the pressure of fixing a build when the whole team is
waiting on them. If a revert is the simplest and most appropriate action to
take, a pair will do it. A revert is simply a tool in our tool belt, it isn't a
hammer to hit every red build on the head with.

A final note is that "Reverting on Red" is a reactive solution, that is, what
to do when it is broken. Another way to look at the problem of a red build is
through preventative solutions, try asking the team what can we do to avoid
this situation?
