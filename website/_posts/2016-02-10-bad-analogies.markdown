---
layout: post
title: Bad Analogies
date: 2016-02-10
---

In software engineering we often try to draw parallels with our profession and
other engineering or creation industries. These analogies often make sense
initially but breakdown as the analogy goes deeper into the process. It also
encourages misinterpretation and sets an unrealistic expectation of how
software is created.

<!--more-->

The typical analogy that is put forward is that building software is like
building a house or a bridge.

Initially this makes sense as both processes have the following phases:

1. Engineers consult with the customer to understand their needs
1. A design of the entity is created
1. Engineers work together to construct the entity
1. The entity is completed and handed over the customer to begin using

When we look at this high level process. The two disciplines have a lot in
common. Unfortunately it is only at this higher level that things fall into
place. Where software engineering begins to drift away from other engineering
disciplines is:

1. A house or bridge has known environment variables - the weather, climate and
   seasons are typically well understood before design and will not change
   significantly for the lifetime of the entity. This provides some
   predictability to the engineers so their design can be built with enough
   resilience to meet extreme changes in environment variables. In contrast,
   the environment around a software system is constantly changing at a rapid
   pace, the users skill levels, technologies, devices are constantly changing,
   attempting to future proof a design to be resilient to these changes is
   impossible as no one can predict with certainty the direction the
   environment around software will take.
1. The needs of the users of a house or bridge will not significantly change
   over time and the solutions to those needs is a solved well understood
   problem. A house or bridge consists of several well known components, for
   example a bathroom, kitchen, bedroom and lounge room. A customer of a house
   will usually be able to predict with high certainty how many of each
   component they will require and the capacity that each component needs to
   support. That is a house will contain 3 to 4 residents, as such 3 bathrooms
   are required, 4 bedrooms and a single kitchen and lounge room. Software
   systems however may start with predictable capacities but grow at exponential
   speeds, as such those initial components might not scale with the growth in
   user numbers. It is hard to imagine an engineer designing a house to sleep 4
   that could in a few years be turned into a hotel serving millions or that
   even though they asked for a kitchen, they have since learned that everyone
   eats out, no one uses the kitchen , so they'd like it replaced with another
   bathroom. This however is a common story with software systems.

The common theme between the above points is that when building a software
system, variables external and internal to the system are constantly changing.
These constantly changing variables require a different process and different
methodology to engineering.

When we draw parallels between other engineering practices and software, we
underplay these variables and such create the expectation that software can
be predictably and uniformly executed like other disciplines.
