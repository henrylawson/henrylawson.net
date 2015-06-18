---
layout: post
title:  "Over Asserting"
date:   2014-03-12 21:00:00
categories: software
---

An observed anti pattern during automated testing both at the unit and application layers is the **over use of asserts to test state being configured during the setup of a test**.

<!--more-->

A code example is provided of this phenomenon:
{% highlight java %}
@Test
public void shouldQuerySoldItemsFroSalesRepository() {
	supportCode.insertItems(ItemFixture.availableItems());
	assertThat(salesTable.all().contains(ItemFixture.availableItems())); // not needed
	supportCode.insertItems(ItemFixture.soldItems());
	assertThat(salesTable.all().contains(ItemFixture.soldItems())); // not needed

	Collection<Item> soldItems = salesRepository.allSold();

	assertThat(response.status(), is(OK));
}
{% endhighlight %}

**When an author feels the need to assert on the state that should be configured by support code** in the test, **it implies that the support code is buggy** and does not work every time. So to ensure that the support code achieved its claimed goal, the author of the test feels they must assert the end state after calling the library method. **This lack of confidence in the support code is understandable however the solution is not solving the root problem.**

The motivation behind the asserts is understandable, **the author wants to ensure that the System Under Test (SUT) is in the correct state before the test** is being performed. The problem however is that **they are making it difficult for the reader of the test to clearly see what the intent of the test is.** Is the intent to assert that that the support code is able to successfully load data into the database? Or is it to assert that the sales repository query is returning all sold items? A further compounding problem is that it also implies that other users of this support library should also assert on the state of the system after calling the support library methods, duplicating the asserts

It is clear that the support code, while complex is not being tested, so the author of the test is sneakily testing it during the test of the SUT.

A better solution would be to remove the asserts from the test, after calling the support code and instead **implement a check within the support library method**. The check will **validate the method was successful in changing the state, if it was not, the support library method should throw an exception** detailing the failure. If the exception is un caught in the test, it will fail the test, achieving the same result as the assert. This is a more explicit way to achieve the same outcome and allows the author to clearly communicate their intent when testing the SUT.
