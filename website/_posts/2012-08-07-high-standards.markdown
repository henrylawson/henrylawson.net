---
layout: post
title:  "High Standards"
date:   2012-08-07 21:00:00
categories: software
---

I recently attended a short talk by a colleague of mine [Darren Smith](http://www.drnsmth.com/). He told the story about how a few years ago on a project he was on, him and his team got together at the start of the project and set a series of extremely **high coding standards that would break the build if they were not adhered too**. These high standards, while being awkward at times resulted in a relatively high quality code base. As the software system grew in size and various problems were being resolved, they slowly loosened the high standards until they eventually reached a _comfort zone_ or a _sweet spot_. The _comfort zone_ was a level of standard that all team members were comfortable with and were able to work within, without feeling restricted by the standards.

Typical forms of [code base metrics](http://www.informit.com/articles/article.aspx?p=1561879) that can be set as standards at the start of a project are:

*   A maximum number of lines per method
*   A maximum cyclomatic complexity
*   A consistent variable, field, property and method naming convention
*   A maximum character limit for names
*   A consistent comment and documentation standard - _[or the enforcement of none](http://c2.com/cgi/wiki?SelfDocumentingCode)_
*   [A minimum test coverage standard]({{ site.url }}/the-magic-number)

For these standards **to be really effective, they can't just be written in a document that new developers are expected to read**. To make these standards add value, **you have to make these be a part of everything else that is adding value to the software system, _the build_**. As developers start to break these standards, conversations start happening about why. It is the outcome of these discussions were a lot of the value of having the standards is shown. [There is never a magic number]({{ site.url }}/the-magic-number), but setting a project wide minimum standard forces the team to have conversations about why their solutions don't meet those standards and can help guide them towards a better solution that does. However, it is important to remember that as these standards start to become restrictive they can always be relaxed but only after the team is in agreement as to why and the  consequences of loosening it.