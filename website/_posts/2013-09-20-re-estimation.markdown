---
layout: post
title:  "Re Estimation"
date:   2013-09-20 21:00:00
categories: software
---

A common debate I have had in a lot of teams is when to re estimate story points. To answer this we have to remember what story points are. **Story points** are measurements of the **overall size and complexity** of a feature being implemented **relative to the other features**. Story points are not estimates for the time it would take to develop the feature. It is however a function of time that may have a linear or non-linear relationship to points. It is important then to not use the time it took to complete a story to justify a re estimation. The reason being that the mental function that is used to determine that story point estimation from time is at best only based on the knowledge you have of the completed estimated stories, their function to time will most likely fluctuate throughout the project.

<!--more-->

The problem I have with most re estimation efforts, which is well explained by [Mike Cohn] (http://www.mountaingoatsoftware.com/company/about-mike-cohn) in his [blog post on the topic] (http://www.mountaingoatsoftware.com/blog/to-re-estimate-or-not-that-is-the-question) is that people often mix _before the fact knowledge_ ([priori knowledge] (http://en.wikipedia.org/wiki/A_priori_and_a_posteriori))  with _after the fact knowledge_ ([posteriori knowledge] (http://en.wikipedia.org/wiki/A_priori_and_a_posteriori)). Let me explain this further.

When the story points were determined, we knew very little about the work needed to be done. We estimated each piece of work, **relative** to the other work we were estimating. The story point estimations we came up with were all relative to each other with the _before the fact knowledge_ we had. We did our best to ensure they were **all consistent with each other** and **all relative to each other**.

Now fast forward a few weeks into the future and we are now working on the story and we have acquired some _after the fact knowledge_. When we re estimate that story and give it a different point estimation, we are in essence, **breaking the consistency and relativity** that we had with those stories when we estimated with our _before the fact knowledge_. This mixing of the priori and posteriori knowledge introduces an in consistency with our estimations.

Now this doesn't mean that all _Re Estimation_ is bad and should be avoided, sometimes it is necessary. However it should only be done if the original estimate was completely off and the impact has a significant change on the relative size of several stories. 

Finally, it should go without saying that, when _Re Estimating_, remember that if you really are trying to be consistent and keep relative sizing then you should also be looking for those stories that are significantly smaller (relatively speaking) and not just the significantly larger (relatively speaking) stories.
