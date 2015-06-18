---
layout: post
title:  "Replacing a Legacy Application"
date:   2012-07-23 21:00:00
categories: software
---

When replacing a legacy application there are typically two approaches:

*   Big Bang
*   Piecemeal

There are advantages and disadvantages to both approaches. The names given to each approach provides insight into how the legacy application is replaced.

<!--more-->

**The Big Bang approach, as its name suggests, involves replacing the legacy application in one shot**. That is, on a given date the legacy application is retired and the new application is fired up. Some _Big Bang_ replacements might have a transition period where both applications are running at the same time. However, a typical _Big Bang_ approach will retire and start up the new application at almost the exact same time. This is done to avoid synchronizing data between the transition period when both legacy and new applications are available.

**The Piecemeal Replacement involves splitting the legacy application into several smaller applications (if it isn't already) and releasing these applications as they are completed. On each release, the relevant parts of the legacy application are then retired**. By a certain date, all parts of the legacy application will have been replaced, at this time the legacy application is retired.

There are some huge advantages and disadvantages to both approaches.

The _Big Bang_ pros and cons are as follows:

*   Difficult to get the application used early by users "in the wild" doing actual work until application is released, typical form of feedback is only from user acceptance testing - in a controlled environment
*   Projects are usually quite large, as the legacy system is often quite large, it is not unheard of for a _Big Bang_ replacement spanning multiple months if not years which inevitably leads to an increased amount of risk
*   The new application if often only seen as a worthy replacement if it reaches feature parity with the legacy application, this leaves little room for innovation and actual problem solving - as it makes the assumption that the legacy application was perfect
*   An appropriate option when the legacy application is too difficult to integrate with or the overhead of integration required for a piecemeal approach is too high

The _Piecemeal_ pros and cons are:

*   The project may have a reduced risk as it has been split into smaller more manageable and possibly more controllable pieces
*   Parts of the application can be released into production earlier and feedback from actual users using the application day in and out can help guide the direction of future parts
*   There is an often, immeasurable amount of overhead in maintaining compatibility between the new replaced parts of the application and the old application
*   Compatibility with the legacy application is usually achieved through syncing data back to the legacy database
*   Complexity increases if the synced data can be altered by other legacy applications
*   Difficult to do without the support and partnership with original owners and developers of the legacy application - first hand knowledge of the legacy application is needed for integration with the replacing application
*   May require a significant amount of rework of the legacy application to black out old features as they are replaced by the new application

The _Piecemeal_ replacement approach definitely melds well with an agile methodology. Being able to release earlier and have the application exposed and tested by users sooner compliments the short iteration and feedback loops that make agile software projects so successful. For software projects that are expected to run in a time frame of  less then three months, the overhead of a _Piecemeal_ replacement might not be worth it, in these situations a _Big Bang_ style replacement might be more appropriate.
