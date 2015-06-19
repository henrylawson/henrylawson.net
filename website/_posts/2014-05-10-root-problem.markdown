---
layout: post
title: Root Problem
date: 2014-05-10
---

When determining a solution to a problem, I have found it invaluable to ask
**"Are we solving the root problem?"**. The first problem that is observed is
typically the symptom, the surface problem, it is the observed affects of the
root problem. The root problem is usually deeper down and requires further
analysis.

<!--more-->

When a problem arises, a motivated team is quick to jump to solutions. For
example, I was recently on a project where two test environments operated on
vastly different dates - often years apart. We had operations that spanned both
test environments and in order to complete our integration testing we needed a
way to convert dates between the two environments so our web service calls and
batch jobs could operate seamlessly.

To solve this problem, our team built a small utility to intercept data between
the two systems and modify the date. Within a few days, our utility could
handle date conversion for all of our interfaces. We had solved our problem.
Or so we had thought.

A few weeks into testing it became clear that our little utility wouldn't be
able to run without manual intervention, the two systems moved at unpredictable
rates. That is, one system would move one day at a time, another would jump
months. **To solve this next problem**, it would require a much more
intelligent and complicated tool to calculate the conversions. So instead, we
pushed on and used the tool for part of the operation and manual calculations
for the other parts. Manual intervention of this form was error prone,
difficult, slow and tedious.

**The problem we had solved** (the dates are different) **was only a _symptom_,
a _surface problem_ the root problem still existed.** The two test environments
are still operating on different dates and **our solution did not address that,
it worked around it.** By solving the _symptom_ and not the _illness_ we left
ourselves vulnerable to other _symptoms_, in this case the other _symptom_ took
the form of the variability in the rate that time moved.

**A solution that does not solve the root problem is called a _band aid
solution_** it covers the wound today, however you can expect it to bust open
tomorrow and cause more pain later.

In a perfect world, we would always solve our **Root Problems**, however as we
know the world we live in is far from perfect and sometimes band aid solutions
are good enough - the hardest part is knowing where to draw the line. In the
example shared above - it turned out that fixing the root problem was too
difficult and beyond the expertise of our team, it became a cost to our
development process that we had to manage.
