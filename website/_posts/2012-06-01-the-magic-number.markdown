---
layout: post
title:  "The Magic Number"
date:   2012-06-01 21:00:00
categories: software
---
There is no magic number for [test coverage](http://martinfowler.com/bliki/TestCoverage.html) but this doesn't mean a magic number shouldn't be set. **Setting a project wide minimum coverage standard that breaks the build can be useful in a [Continuous Integration](http://martinfowler.com/articles/continuousIntegration.html) environment**.

<!--more-->

The significance of the chosen minimum coverage standard must be understood by all team members and they must be aware that this coverage minimum is not permanent. It is merely a minimum standard that all future tests should aim for. A marker in the sand that represents the teams current coverage standard. A standard that anyone on the team can change, at any time.

If new code is developed that brings the code base below this minimum standard, when it is checked in it will break the build. It forces the developers to ask the question "**Why is this new section of code receiving a lower coverage than the current project minimum standard?**". If the answer is because inadequate tests have been written, then the minimum coverage standard has served its purpose. If the answer to the question is that this new piece of functionality is not testable or too difficult to test then a quick huddle can be had among the developers and the test can be improved or the standard can be lowered as that piece of functionality will hopefully be tested at a higher level ([integration, functional, manual, etc](http://martinfowler.com/bliki/TestPyramid.html)). **The important aspects in both situations is that a conversation was had and that developers were forced to think about the "thoroughness" of their tests.**

To reiterate further, if the answer to the question had been that the new functionality being checked in contains a large amount of [DTO's](http://en.wikipedia.org/wiki/Data_transfer_object) with large amounts of simple properties that don't need to be tested, then lowering the standard for this circumstance might be OK. The important point to note is that by setting a standard and having it enforced through a direct form of feedback such as making it a part of the projects Continuous Integration process stimulates conversation and ensures that all developers are making conscious decisions about the tests they are writing or **not writing**. The quick huddles that occur also provides transparency to other developers so they are kept in the loop about parts of the project they may not be working on and the direction those parts are taking.
