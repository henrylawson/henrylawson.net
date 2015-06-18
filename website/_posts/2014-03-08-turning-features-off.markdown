---
layout: post
title:  "Turning Features Off"
date:   2014-03-08 21:00:00
categories: software
--- 

Software developers and stakeholders have to be brave enough to make the call to **switch a feature off, for good**. 

Too often software is valued by it's feature set. The bigger the list of features that the software contains the more valueable it is perceived to be as it appears to be a more richer application to a client.  But what if no one actually uses any of those features? How much value do they provide now? 

<!--more-->

Well the answer to that question is that they are probably provding a net negative value. That is the cost to maintain and extend that feature far outways it's overall value and hence it's value is net negative. Now you might read that and think, well that feature is done and tested - development for it finished many releases ago, it costs nothing to stay in the application. 

**The truth is that while most of that is correct you also have to consider the added complexity that that feature introduces to the code base of the application.** 

It may also be a hindrance when new features or functionality is introduced as the functionality has to be taken into account and may need modification to incorperate the new business rule or information that has been incorperated into the application. This then inflates the cost of new features. 

There is also the cost of keeping the extra concept as part of the domain of the application. Developers need to maintain the concepts in their mind and understand their behaviour when implenting new changes. This has a high cost. 

Some features must stay as these provide marketing value, features that make the application more sellable such as supporting some obscure mobile device - should remain, but if the value is minimal, consider that it is probably costing more to keep it.
