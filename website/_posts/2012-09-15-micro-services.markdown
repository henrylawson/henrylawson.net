---
layout: post
title:  "Micro Services"
date:   2013-09-15 21:00:00
categories: software
---

Recently I attended a presentation by [James Lewis](http://bovon.org/), a
colleague of mine. [James's presentation was titled _Micro
Services_](http://www.slideshare.net/jamesalewis/java-microservices). I was
quite impressed with the ideas being presented, I found _Micro Services_ to be
a very simple solution to complex problems - which in my opinion is what you
want every solution to be.

<!--more-->

The problem they were setting out to solve would typically be solved with an
[Enterprise Service Bus](http://en.wikipedia.org/wiki/Enterprise_service_bus)
(ESB). However instead of going down the ESB route they decided to solve the
problem using a series of REST based services. Each service was responsible for
a single thing and was kept as small as possible. Each had an event store that
would collect incoming requests; feeding of the event store in a [Competing
Consumer](http://www.eaipatterns.com/CompetingConsumers.html) style was a
queue-processing engine that was controlled by the interested service. On
completion of a job the service would then create an event that would be picked
up by other services to continue on with other actions.

_Micro Services_ draw their fundamental [philosophies from
Unix](http://en.wikipedia.org/wiki/Unix_philosophy). More specifically they
focus on 3 of [Mike Gancarz's](http://amzn.to/2fNgMmu)
famously quoted precepts:

*   Small is beautiful.
*   Make each program do one thing well.
*   Build a prototype as soon as possible.

This heavily modularized
[REST](http://amzn.to/2fNiRyu)
based service approach brought the following advantages:

*   The system was built on top of HTTP. One of their major requirements was
    that the system had to scale and what technology is better at scaling then
    the web. It is at a mature stage right now where there are so many tools
    and practices that facilitate  scaling so well
    ([Auto-scaling](http://aws.amazon.com/autoscaling/), [Cloud
    Computing](http://en.wikipedia.org/wiki/Cloud_computing), [Load
    Balancing](http://en.wikipedia.org/wiki/Load_balancing_(computing)),
    [Caching](http://en.wikipedia.org/wiki/Web_cache)). Using proven techniques
    matured by the web, parts of the system can be easily scaled when they are
    hit with heavy traffic.
*   The publish and subscribe model of communication between services makes
    work flow impacts minimal - existing services can continue to operate if a
    new service is added or an old modified, providing their events are still
    published somewhere.
*   Services are so small that it becomes easy to identify and minimize impact
    areas when changes to behavior need to occur.
*   [Third party components and tools can be easily
    integrated](http://www.markhneedham.com/blog/2012/12/04/micro-services-plugging-in-3rd-party-components/)
    in the system using the [Adapter Pattern]({{ site.url
    }}/the-adapter-pattern), a small _Micro Service_ can be made to wrap over a
    third party component. This will also minimize the systems dependency on
    the component as it can be easily replaced or removed at a later date.
*   The entire system is more resilient to failure as it is broken into many
    collaborating pieces and services can continue working independently. The
    system can recover as soon as soon as failed services come back online -
    demand is met through auto-scaling solutions for the service.
*   Parallel development is made easy as teams can work independently once
    interfaces with other services are decided.
* Due to the smaller nature of the code base, ramp up time and understanding
  of a _Micro Service_ is significantly lower then that of typical Services

One of the characteristics that I find most powerful about _Micro Services_ is
that they focus on a single thing and do it well. Having small, well composed
services provides you with a lot of flexibility. One of the typical problems in
large service oriented architectures is that services become large and
unwieldy, changes become expensive, the domain grows and becomes complicated.
_Micro Services_ have a better chance at avoiding these problems by remaining
small. By their design they have a smaller domain, a smaller code base and
should be cheaper and easier to modify and extend over time.

One of the caveats of _Micro Services_ is that they can become chatty over the
network. One means to avoid excessive communication over HTTP is to implement
an architecture by slicing _Micro Services_ by User Flow or breaking apart
pieces of the Value Stream and not slicing by Domain Verticals. For example,
when a user purchases a product from a store, the request **should not** bounce
between the User, Product, Inventory and Order services, **it should at most
hit a single ProductOrder service** which will handle the order and publish the
result to another _Micro Service_ which will propagate the order information by
means of publication to other _Micro Services_ in the work flow.

_Micro Services_ are in their infancy, over time more knowledge and experience
will be built up around this topic, as it is now though, they are definitely an
exciting idea.
