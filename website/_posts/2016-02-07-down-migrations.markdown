---
layout: post
title: Down Migrations
date: 2016-02-07
---

Having worked with database migration tools in anger for several years, some
best practices have become clearer over time. The most important is with the
usage of down migrations. In this article I'll provide some learning's that
have resulted in my devaluing the purpose of such scripts.

<!--more-->

A typical database migration tool will provide the ability to write an "up" and
a "down" script. An "up" script, updates the schema and or data of the database
to the latest standard for that point in time - it "upgrades". A "down" script
is also written that will downgrade the change performed by the "up" - it
"downgrades". The "down" script is typically used when an issue occurs during a
deployment and the changes to the database by the "up" script need to be
undone.

The "up" and "down" scripts are written under the following assumptions:

- The changes are non destructive, i.e. they are not a DROP, DELETE, TRUNCATE,
  these type of changes are impossible to reverse
- A "down" script assumes all parts of the "up" script have failed and need to
  be undone, typically this is not the case, it might be possible to write
  multiple "up" and "down" scripts for each small changes but testing each in
  combination for a deployment can become complicated
- The execution of the "down" script is done in coordination with the reversal
  of the application code too
- The execution of the "up" and "down" script is done during an application
  downtime when no new data is being inserted between "up" and "down", building
  in an assumption that is being updated and inserted after an "up" and before
  a "down" compounds testing complexity. Typically an issue introduced by a
  deployment may not become apparent until multiple users have attempted
  transactions, by this time it may no longer be possible "roll back", the only
  option is to continue to "roll forward"

In practice, the above assumptions never hold true. Instead it is more
beneficial to:

- Write an "up" script that is compatible with all versions of the application
  in production. If there is an error in the application code or the migration,
  nothing needs to be undone, as the app and database can continue to work
  together at different versions, nothing needs to be undone.
- Rely on database technologies such as snapshots and restores to recover from
  any migration failures, these are more reliable as an automated snapshot
  recovery procedure can be created once and will allow for recovery from more
  types of failures. In comparison a "down" script requires testing for each
  script and each permutation and expected failure type.
