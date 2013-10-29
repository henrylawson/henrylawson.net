---
layout: post
title:  "Counting Points at Dev Done in Hindsight"
date:   2012-07-14 21:00:00
categories: software
---

A month ago or so, I wrote about [Counting Points at Dev Done](http://henrylawson.net/counting-points-at-dev-done) and the discussion my team back then engaged in on the topic. The summary of that article was basically:

**Counting points at developer done goes against the traditional way of counting points after sign off. However, we felt back then that one of the purposes of counting points is to communicate progress. That said, provided that there are no extreme fluctuations in the amount of work that is required post developer done and everyone has a consistent understanding of how progress is being measured - it should be OK.**

Having now delivered and released the software its interesting how my opinion on this topic has shifted. I still believe that the above statement is 100% correct and that there is no problem with counting points at developer done. However the clause that is attached to the above statement is hard to ensure.

The clause reads "_provided that there are no extreme fluctuations in the amount of work that is required post developer done and everyone has a consistent understanding of how progress is being measured - it should be OK_", having now attempted to do this I would say that counting points at developer done is risky business. Here are some reasons why:

*   You can't predict how long a story will be in QA for and just like how stories play out when "in dev" they can sometimes explode in workload in QA too
*   You can't control how often a story will be bounced back from the client
*   The team moves onto new stories instead of completely clearing out the old ones, this becomes problematic when a story bounces back but the developers have moved onto other stories
*   The above leads to too many stories being in play at once
*   Backlogs in QA don't get cleared out because the developers pick up stories for the new iteration even though the last iteration stories are still in play by QA
*   If the team isn't doing BDD, functional tests might not exist when refactoring for stories from the new iteration begins, this results in more bugs creeping in

Most of the above issues are self explanatory one other problem with counting points at developer done is that it makes it even harder to plan:

*   The project will be predicted to end on a Friday and on Monday the team will prepare for release, however people forgot that done means developer done so those stories still need to be reviewed by the client and passed by QA
*   The overflow of the post developer done work means that this unplanned work eats into UAT and release related work
*   The above two points result in an extremely stressful release period as there is a lot of work to do that was never accounted for

All in all, unless you can ensure that the above clause is kept, it's safest to count your points after sign off.