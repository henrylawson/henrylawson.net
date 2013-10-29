---
layout: post
title:  "Not Configurable is Configurable"
date:   2012-08-28 21:00:00
categories: software
---

Some of the _most configurable code_ I have ever come across is also some of the _least configurable code_ I have ever come across. It's a bit of an oxymoron but I really do believe it is true. To clarify, **code that is written to solve a single problem in the most simple way, is more configurable then code that tries to solve a multitude of problems, all at once**. I have also found that this is true for code that is written to be configurable for tomorrow, for that unknown requirement that might appear next week or that story that might get played in the next iteration. **The extra complexity added to the solution makes the code less flexible, harder to understand, unnecessarily complex _and less configurable_**.

I can recount on a few occasions when I have tried to have foresight into the stories coming down the pipeline and have attempted to account for them in the code for the story I was playing. The typical outcome was to discover that the method or class I had introduced to account for that future story was actually completely useless and reworking it out of the solution was more effort than it was worth. This is contrary to when I find those nice, simple, three liner solutions to the problem that are simple to understand, simple to refactor and simple to extend.

To summarize in a more consumable form:

1.  **Making code configurable can restrict flexibility**
2.  A simple basic solution is actually more configurable in the future as it can be easily extended and modified
3.  Trying to account for every possible configurable outcome increases the amount of code and the complexity of the code

An awesome talk that covers this on a more architectural level is, [Simplicity Matters - Rich Hickey](http://www.youtube.com/watch?v=rI8tNMsozo0).