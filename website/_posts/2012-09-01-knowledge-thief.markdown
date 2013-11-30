---
layout: post
title:  "Knowledge Thief"
date:   2013-09-01 21:00:00
categories: software
---

A common trend in software teams is that over time team members start to acquire nieche pieces of knowledge about the software system they are developing. These typical pieces of information are things like, but not limited too:

*   Ensuring certain settings on the Database are enabled
*   Ensuring some third party component or dependency is installed on the application running the machine
*   Ensuring the correct version of a dependency is installed
*   Ensuring developers are using the correct tools in their IDE

These items are small enough that the system will probably run fine when a couple of them are missing or not met, or perhaps cause quirky hard-to-debug problems instead. The typical solution for handling these types of environment and system variabilities is to write a little readme file, or perhaps a wiki page somewhere and direct people to it - or worse do nothing at all and everyone becomes devependent on the single developer who has that knowledge. The problem with documenting the information is that it is rarely read or maintained and a lot of time and hardache is spent ensuring those manual documents are up to date and comprehensible. The obvious problem with the single expert is that the entire system becomes dependent on the single developer - a single point of failure for the system.

**A better solution is to ensure that all developers put everything they know into the source code of the system and check it into source control with the entire application.**

Those database settings can be a part of a build task to configure the database, runnable from the developers commandline. The install and configuration of that third party component can also be a task. Dependency management and installation can also be integrated as build tasks. Once more and more tasks get written, groupings become clear. All of the tasks listed above are a apart of a greater workflow that could be described as "Setting up a developers box". Creating a parent task that executes all of the above steps results in an automated on boarding experience for new developers. Making the tasks idempontent, makes the workflow reusable for existing developers as it now provides a central place for developers to put automated steps to configure and setup their environments. This includes the setup and configuration of new third party components. An automated build task will also ensure consistency across all development environments and eliminate version and configuration variabilities between developer boxes.

Ensuring that the task is regularly run, by old developers and new developers say everytime they checkout the code (remember tasks are indempontent so they should be fast if they don't need to do anything) will ensure that the scripts are always up to date. When environment changes are neccessary, ensure developers add them to the workflow. This way their change is automatically documented in history and can be easily understood and read by all members of the team. The knowledge is no longer buried in a document or in someones mind.

Github makes this apart of their mantra by encouraging developers to create bootstrap.sh files for their projects, which setup a developers box with all the required dependecies. Essentially "bootstrapping" them for development with the project.

The example and solution here may not be ideal for all cirucmstances but the underlying principle is important. _Don't rely on documents or people to convey application knowledge, make the application convey it._

**Don't be a knowledge thief, script everything you know into the application.**

This article was motivated by a presentation my colleague made, Scott Shaw, who was quoting and referring to a blog post made by an ex colleage, [Dan North] (http://dannorth.net/).