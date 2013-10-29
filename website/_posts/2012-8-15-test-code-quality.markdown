---
layout: post
title:  "Test Code Quality"
date:   2012-08-15 21:00:00
categories: software
---

Developing code with a strict [TDD](http://c2.com/cgi/wiki?TestDrivenDevelopment) approach usually results in a fair amount of time being spent writing, extending and modifying tests - which is fine, **the better the tests are, the better the solution that is driven out is**. One thing I have definitely found after working through various legacy code bases and pairing with people here and there is that not everyone applies the same level care, application of good patterns and principles to writing their tests, as they might do for when they are writing their solutions. The attitudes observed are:

*   This is just test code, it's OK to copy and paste the same setup logic for a mock in each test
*   We don't need to use a factory method or class to instantiate these entities, we can just copy paste them from the other test
*   It's better to have all of the logic repeated for each test so that you can see what is being used right here in the test - _resulting in several 50 line test methods with large amounts of duplication_
*   Oh it doesn't matter what you put there to do that, it's just a test

**Test code is a first class citizen in your software system, just as your solution code is**. **Together they make up your code base**. The amount of time being spent extending, modifying and growing your test code should be and probably will be, especially when doing [TDD](http://c2.com/cgi/wiki?TestDrivenDevelopment), equally proportional to the time you are spending in your solution code. **The patterns and principles that are proven to assist in the maintainability, flexibility, simplicity and longevity of solution code, should and must be applied in test code if you expect your code base to survive**. The two can not be viewed as separate entities, for a software system to be successful, the two have to grow together and be just as maintainable and clean as the other. You wouldn't copy and paste the same method or the same logic a dozen times in your solution code, for the simple reasons that it makes the code harder to maintain and more difficult to extend. A simple update to a piece of logic in your solution code shouldn't require a plethora of repetitive changes in your test code. If you want longevity in your code base, **then you have to start applying the same patterns and principles to your test code that you apply to your solution code**.