---
layout: post
title:  "Read The Soure Code"
date:   2014-03-07 21:00:00
categories: software
--- 

A while back I heavily leveraged the SolrNet library to interact with a Solr instance for searching capabilities from a .Net application. At that time the library was in it's early stages and the state of it's documentation was growing. **Many of the APIs we ended up leveraging were undocumented.** 

<!--more-->

Our only way to find out how to make use of all of Solr's features, using SolrNet, was to **grep the source code and do a deep dive into the implementation**. Fortunately for us, the library was well unit tested and we were able to **determine most of the functionality from what unit tests had been written**. 

Reading the source code gave great advantages, we were able to:

1. Find out undocumented features
2. Better understand limitations of the library
3. Track down strange behavior and determine the correct usage of certain APIs

However, reading the source code came with some caveats: 

1. As the APIs were not documented yet, we ran the risk of leveraging an API that could change significantly in the future
2. We could be calling code that the author did not feel was ready for prime time yet and might not be well tested

**We protected ourselves against these potentials by having thorough end-to-end regression tests** that exercised the search functionality from our applications UI. If the undocumented APIs in the library changed after an upgrade, our regression tests would catch it and we could refactor our usage back to a green test.
