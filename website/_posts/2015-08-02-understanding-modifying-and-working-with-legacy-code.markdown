---
layout: post
title: Understanding, Modifying and Working With Legacy Code
date: 2015-08-02
excerpt: >
  In most software engineering jobs today, very rarely will an engineer
  find themselves working with a green field code base. The likely situation
  is that a developer will be working with an old, legacy code base. This
  article provides some tips and insights on how to deal with and master legacy
  code.
---

When joining a new project an engineer is met with the daunting task of having
to comprehend years of domain and application knowledge. Complex business
processes are sometimes even more complexly expressed in code.

Working as a consultant, you get the opportunity to work in various domains and
industries, the advantages being that you get great exposure to how these
business work and how they use technology to solve their problems.  One of the
major downsides though is that you often find yourself having to ramp up on
legacy complex code bases in a limited time frame.

Below are some of the techniques I have used with success in the first few days
upon joining a new project to get a grasp of the code base that I will be
working with.

Some of these ideas are presented in [Object-Oriented Re-engineering
Patterns](http://scg.unibe.ch/download/oorp/) and [Michael Feathers - Working
with Legacy
Code](http://www.amazon.com/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052).
If you are after more information I suggest checking out those resources. Note
that the steps below are mix of hard (code/technology) and soft (people) items.
Working with legacy code is just as much about understanding the people and
business around it as it is the actual code.

1. **Listen and assume the best of the people before you,** the worst thing you
   can possibly do when joining a new project is not listen when people are
   speaking to you, now is not the time to interject and cut them off with your
   opinions and thoughts on how you think they should of solved a problem, or
   how you solved that problem on your previous project. This will most likely
   lead to people becoming defensive and holding back information from you in
   fear that you will cast judgment on them. The other important fact is that -
   while you may be bringing in a wealth of experience and knowledge from other
   projects - until you have listened and understood the problems that this
   team is facing and solving, you can't possibly know that what worked on your
   last project will work here unless you stop talking, listen and allow the
   existing team members to explain the context to you.
1. **Understand what your are doing there,** hopefully someone has already
   taken the time to on board you, welcome you to the team, explain the current
   environment and why it is they have brought you onto the team, if they
   haven't, now is a good time to clarify those items and understand what your
   stakeholders' and your team's expectations are of you. Clearing up these
   expectations at the start will allow you to align for success
   immediately or to reset expectations if you do not think you will be able
   to meet them.
1. **Meet the team and remember their names.** When you first join a project
   or a team it is important to try meet all the right people and remember
   their names, draw a stakeholder map and note down peoples roles and
   responsibilities, you will have lots of questions upon joining and knowing
   who the right people to approach in speak to will make the whole process
   smoother.
1. **Take notes and determine if this on boarding can be improved** Some teams
   are mature and have an excellent on boarding process, some have none at
   all. As you go through your new teams process, take notes on ways it can be
   improved and take action once your on boarding completes and improve the
   process so that others after you can have a better experience. This might
   mean preparing a document, a welcome letter or an on boarding deck that can
   be re used by others.
1. **Have a technology/architecture overview,** book in a short time or pull up
   some documentation to understand what it is the system does that you will be
   working on and how it fits into the various business processes of the
   organisation. It is important to have this explained in the context of how
   the system fulfills a customer need.  Having it explained in this view will
   help solidify the knowledge as it is much easier to relate to an explanation
   when you can imagine yourself as a customer going through this system.
1. **Read the code in an hour,** this won't be possible on all projects but you
   should give it a go. Check out the source code, read through it, get a feel
   for the architecture, the modules the coding style, the messy bits, the
   small bits, the complex bits, the domain terms, it won't all make sense now
   but having some familiarity with what you are working with will help you
   build a clearer picture as more information is introduced to you over time.
1. **Read the test output, go into the tests** review any test reports and
   start reading through the test cases, unit tests or functional tests. Get
   familiar with the domain language and the terms being used and what is being
   tested. Like reading the source code, these pieces of information will help
   you build a clearer picture over time.
1. **Do some static analysis, number of lines, classes, etc.** Again, this will
   allow you to wrap your head around the legacy code base and understand how
   big it is and where the potential hot spots are.
1. **Do some static code commit analysis** along with the above analysis these
   two can compliment each other and provide some good insights into areas of
   the code base that are getting a lot of activity - if all the commits and
   changes are happening in one God Class, or on one API service, this could
   be a potential hot spot to look out for when making changes.
1. **Understand the DB,** take a look at the conceptual schema of the DB,
   understand the relationships between the data models, what models are the
   biggest and have the most number of records, how often are different models
   written to, combined with the overview, the static analysis, the code/test
   reading you should be building a clearer mental picture of what it is this
   system does and how it is able to do it.
1. **Talk to the maintainers,** don't forget to talk to the existing system
   maintainers, they no doubt have a wealth of knowledge and experience that
   you can tap into. Again it is important in the early stages to listen, take
   notes and learn. Ask them about what the challenges, gotchas and pain points
   are when working with the system. This will help you prepare and be
   informed.
1. **Talk to the users, watch them use the app** this can sometimes be a
   difficult task. Depending on the environment that you work in the
   development team can sometimes be very far removed from the actual end
   users. You should really push to meet your end users and if possible, sit
   with them as they use the application and complete tasks using it. This will
   help you build empathy for what you are doing and will help paint a clearer
   picture in your mind about how this system helps the business.
1. **Build and run the tests, look at the build scripts, CI,** getting this out
   of the way early is a huge bonus, you will get a clear understanding from
   the get go on the end to end process of writing code and how that change is
   finally reflected to the users. Take notes on your experience pulling down
   the code and getting your development environment setup - if it was hard,
   consider what can be improved - is there documentation missing? Then add it.
   Can this process be automated? Turn your notes into a bootstrap script
   to setup a development box.
1. **Install or deploy the app.** Some applications have a very simple
   deployment process, others have a very complex one. Try and get familiar
   with this new systems process so you can be conscious of how your changes or
   future work may improve or make deploying the application harder.
1. **Refactor the code to understand, throw it away.** This is a good way to
   get familiar with the application as you read the code. Try refactor the code
   so that it becomes familiar to you and so that it is more readable, if there
   are tests and you are sure your refactoring has not regressed anything -
   check it in. If the code is legacy and you are not confident, don't be
   afraid to throw away your refactoring - if you do end up working in that
   area, you can clean it up with your refactoring then and introduce some better tests.
1. **Review the documentation.** I leave this to near the end as often
   the systems I end up working on don't have any documentation or the
   documentation is out of date. Even if it is out of date it is still worth
   reading and perhaps you as the new team member can improve the documentation and
   bring it up to date on your learning's.
1. **Review the most recent stories, requirements, change requests,** try and
   understand how the application has been evolving over the last few months.
   Review what features and stories the business has requested and get a feel
   for how many bugs have been filed, what the bugs were and who discovered
   them and when they were discovered - was it in PROD or before that?

While this list is in no ways comprehensive, these are some of the key things
that have been successful when ramping up onto a new project. If you were to do
just one item on this list, ensure it is number 1, listening and showing
respect to those before you will set you up for the most success.

