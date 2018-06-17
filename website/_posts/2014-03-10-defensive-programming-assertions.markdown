---
layout: post
title:  "Defensive Programming Assertions"
date:   2014-03-10 21:00:00
categories: software
--- 

Java and many other languages allow you to assert that the input parameters to a method meet certain conditions, if these parameters do not satisfy the assertions requirements, the method call will fail. The requirements are usually defined by the usage of the parameter in the method. These assertions are a technique that is employed as part of Defensive Programming. A programming mantra were the author of a library method performs aggressive validation of all input parameters to a method call and fails if the required conditions are not met.

<!--more-->

A typical usage of assertions on a method parameter looks like the following:

{% highlight java %}
public double divideEvenNumberAndAddFive(int numerator, int denominator) {
	assert denominator > 0;
	assert numerator % 2 == 0;
	return (numerator / denominator) + 5;
}
{% endhighlight %} 

For most typical usages of assertions, or similar aggressive input validation as part of Defensive Programming, **I have observed that the validation logic is actually a code smell for a lost domain concept**.

For example, _the first parameter in the above method, must be an even number_, as defined by the assertion. _The second parameter should be greater then zero_. **The author could introduce a tiny type to encapsulate this information and express the concept more explicitly.** 

Using tiny types, encapsulating the validation logic and introducing the domain concepts. The above method could instead become:

{% highlight java %}
public double divideEvenNumberAndAddFive(EvenInteger evenNumber, PositiveInteger positiveNumber) {
	return evenNumber.divideBy(positiveNumber).plus(5);
}
{% endhighlight %} 
