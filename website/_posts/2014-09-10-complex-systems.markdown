---
layout: post
title: Complex Systems
date: 2014-09-10
---

I recently watched a short talk by [Richard
Cook](http://www.researchgate.net/profile/Richard_Cook3) from the Royal
Institute of [Technology -
Stockholm](https://www.youtube.com/watch?v=2S0k12uZR14). In the talk, Richard
presented his research on **how complex systems don't fail**.

<!--more-->

**A typical system that we develop on and extend is a Complex System**. We try to
describe these systems using Flow Diagrams, Universal Modelling Language
Diagrams and typical System Architecture Diagrams. In his talk Richard
challenges this idea and explains that **most systems are stochastic**. A
stochastic system is one where the behaviour **can be measured statistically and
not predicted precisely**.

Now a typical system has lots of moving parts, databases, message queues,
network connections - **alone one of these components may behave
deterministically but interacting together can result in something that is best
described stochastically**.

When building these systems, Richard points out that we build these systems
with the aim for them to be available, to achieve this once deployed and
operating we:

1. Monitor it
2. Respond to it
3. Adapt it
4. Learn about it

**By combining the above four activities we make our complex system resilient**.

When we build complex systems we have a different set of goals, **we design our
systems to be reliable**. To be reliable we:

1. Encapsulate complexity by creating abstractions and only allowing a known
   set of inputs
1. Implement defence in depth - creating multiple layers of security to provide
   fall backs in the case of a vulnerability or failure in one layer
1. Create Redundancy - clusters, load balanced servers
1. Embed assurances - formal reviews and audits
1. Make people accountable for the system's

Now **if our systems are completely deterministic, building for reliability makes
sense** because we still believe that we can predict precisely how it will
operate.  **If we accept that our systems are stochastic, we accept that our
complex systems will fail and that we should instead design for resilience**.

To design to be resilient we can:

1. Accept that systems continue to evolve and grow beyond delivery and need to
   be developed with processes in place to continue the evolution of the system
over time
1. Recognise the role of operations and maintenance people, build systems that
   expose controls and tools to these groups to support the system
1. Envision operating failures and build systems that can recover
1. Allow for simulation in the application so that the affect that operator
   changes will have can be tested
1. Empower operator learning
1. Make resilience engineering critical to the design of your systems

From this talk, I don't think I'll stop building systems that are reliable,
reliability is still a characteristic I think is worth building for - however
for a complex system to be available it is now clear that resilience needs to
be designed for as well. Accepting that failures do happen and designing systems
to be easily recoverable is also a very important characteristic. A characteristic
that I have learnt many times over by doing production support.
