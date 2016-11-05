---
layout: post
title:  "The Adaptor Pattern"
date:   2012-07-26 21:00:00
categories: software
---

[The Adapter Pattern](http://www.oodesign.com/adapter-pattern.html) is probably
the most commonly used pattern of all the [famous patterns in computer
science](http://amzn.to/2flABxT).
It's also, not surprisingly one of the handiest to have to in your tool belt.

<!--more-->

The primary purpose of the adapter pattern is to do what adapters do in the
real world. Just as power adapters provide a wrapper around a power plug for
use in a foreign wall socket, an implementation of a software adapter will wrap
around a class to provide it with a more common interface that consumers would
expect. One of the other benefits of the Adapter Pattern is that it can
increase encapsulation and reduce coupling of classes being used in your
software system. As a side affect of this, it can also make mocking
dependencies from your System Under Test a lot easier when unit testing in
isolation.

Some typical cases for the use of the Adapter Pattern are:

1.  To encapsulate calls to external libraries and frameworks
2.  To provide a common interface to various implementations that are used by
    the same consumers
3.  To provide a consistent API to a system that is being modified regularly
4.  To enable a class to fulfill an interface it was not designed with

The first example on that list is usually the most common. However, applied
mindlessly it can be more of a hindrance. Almost every application will need a
logging, or configuration framework at some point in it's life and there are a
lot of libraries out there that do a great job of it. What can often be painful
is when a library is referenced from everywhere in your application. Logging
and configuration management frameworks are usually platform specific and when
the code is being run on a different platform, there is typically a more
appropriate framework. If the old framework is referenced directly throughout
the code, the code is highly coupled to the framework and as such, the
platform. This is why I usually prefer to communicate with utility frameworks
from a common interface and implement the Adapter Pattern for each framework.
This reduces coupling and makes the code more platform agnostic. It also acts
as a layer of insulation against API changes and makes mocking these utility
frameworks easy during testing.

With external frameworks you have to pick and choose your battles. For
frameworks that expose a large API that will be used heavily throughout the
project, it probably is not worth the trouble of insulating calls to it through
a common interface and an adapter. It is often easier to accept that there will
have to be some level of coupling to the framework from your code and to just
go ahead and use it to create the most simple solution possible.
