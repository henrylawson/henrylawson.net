---
layout: post
title:  "Layers on Layers"
date:   2012-08-27 21:00:00
categories: software
---

> Any problem in computer science can be solved with one additional layer of indirection. But that usually will create another problem.
> **[David Wheeler](http://en.wikipedia.org/wiki/David_Wheeler_(computer_scientist))**

<!--more-->

This quote is true for almost every architectural problem I have ever come across or heard about. By increasing the level of [abstraction](http://en.wikipedia.org/wiki/Abstraction_(computer_science)), a problem can be better understood and resolved. There is obviously a breaking point with this though. At some stage those abstraction layers make the solution less extensible and more difficult to understand. The [OSI](http://en.wikipedia.org/wiki/OSI_model) model is a perfect example of how at an architectural level, having the right amount of abstraction can make a complex problem seem simple.

The OSI Model provides abstraction layers to characterize and standardize the functions of a communication system. Each layer in the model is responsible for serving the layer above and operating on the layer below it. This same idea of abstraction is applied to solve large scale enterprise systems problems through the principles guiding [SOA](http://en.wikipedia.org/wiki/Service-oriented_architecture). At a more micro level, levels of indirection can be seen in the use of [ORM's](http://en.wikipedia.org/wiki/Object-relational_mapping), [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) and the [Adapter Pattern]({% post_url 2012-07-26-the-adapter-pattern %}).

The greatest benefit that indirection brings to problems in computer science is that it simplifies understanding by breaking a complex problem into thinner slices. At anytime, you only have to understand the responsibilities of the layer you are working in and what information it has available from the layer below and what it needs to expose to the layer above. **These thin slices of segregated responsibility reduce coupling for each part of the solution**. As each slice is interacting through an an interface to the layers above and below, _the implementation details of layers can be thrown away and rewritten for simpler, more efficient solutions with zero impact to the system as a whole_ - provided they fulfill the responsibility of the interface of their layer.

**Where indirection begins to fall apart is where it over complicates the solution to a problem**. Increasing indirection for a complex problem can make the problem appear simpler at each layer. This is because the problem can be broken down into manageable, comprehensible slices. Increasing indirection for a simple problem increases the complexity of the solution. If each layer has a minute amount of responsibility, the added layers of indirection between where the problem originates and is finally solved, makes the solution harder to comprehend and understand. **The benefit of indirection is only seen when each layer can be considered and understood independently of all the others**. If a solution with indirection requires you to understand multiple layers at once while in a certain layer, that is an indication that indirection might not be the correct solution. A good rule of thumb is to not start out with various layers of abstraction and to only introduce it when it is really needed ([KISS](http://en.wikipedia.org/wiki/KISS_principle) and [YAGNI](http://martinfowler.com/bliki/Yagni.html)).
