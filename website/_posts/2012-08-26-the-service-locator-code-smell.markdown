---
layout: post
title:  "The Service Locator Code Smell"
date:   2012-08-26 21:00:00
categories: software
---

Recently on my team it was suggested that we start using the [Service Locator](http://martinfowler.com/articles/injection.html) pattern to load up our fields instead of using the [Constructor Injection](http://martinfowler.com/articles/injection.html) pattern that we had been using heavily in our project. The main reasoning for the move was that **our MVC controller constructors were starting to get really bloated** with parameters and this was becoming painful to mock in tests.

<!--more-->

The [Service Locator vs. Dependency Injection](http://martinfowler.com/articles/injection.html) debate is a never ending one and here are my thoughts on it. The main problems I see with using a Service Locator to provide instances to consuming classes are:

1.  It means every class is tightly coupled to the Service Locator which I don't see as a very good coupling. You would also have to ensure that you use an adapter so as not to couple the entire code-base to your [IOC](http://martinfowler.com/articles/injection.html) tool.
2.  It makes it more difficult to use and test classes that are using the Service Locator as you have to look at all of the fields and source code of that class for all calls to the Service Locator. This is so you can see what instances you need to seed into the Service Locator before creating the object.
3.  Failing to do the above well means that you will start getting weird exceptions everywhere as you forgot to seed in a a particular instance - these problems also only happen at runtime, no compiler checking. This would mainly pop up in testing but could also creep its way into production if your IOC tool is miss configured to not return the right instance. However this would also happen with Dependency Injection too but is less likely when not using an IOC tool.

With the above points noted, it was all kind of irrelevant in our case as **the issue wasn't Service Locator vs. Dependency Injection**, the issue was that **we had a code smell and the suggested solution was to bury it into the code where it would be harder to find**.

The bloated constructors that were mentioned are actually a code smell. If a class is taking in a large amount of parameters in its constructor it probably means it has a lot more than just a [single responsibility (SRP)](http://www.objectmentor.com/resources/articles/srp.pdf). So in the end, the solution was to break up the bloated controllers and to split them up by their responsibility, the side effect of this of course was smaller more manageable constructors.

Back onto the Service Locator vs. Dependency Injection topic, a few people have written about the Service Locator pattern as being an anti-pattern, I don't think it is an anti-pattern, it has its place in IOC but I think it should be used with care:

1.  [Service Locator Is An Anti Pattern - Mark Seemann](http://blog.ploeh.dk/2010/02/03/ServiceLocatorIsAnAntiPattern.aspx)
2.  [Service Locator Anti Pattern - Andy French](http://www.andyfrench.info/2011/05/service-locator-anti-pattern_17.html)

All in all, it was an interesting exercise of how sneaky some code smells can be and unless you have a nose for them, how they can sometimes easily sneak under the radar.
