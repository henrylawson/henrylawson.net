---
layout: post
title:  "Whitespace"
date:   2013-09-25 21:00:00
categories: software
---

_Whitespace_ in our code is something that many developers don't spend much time thinking about, however it is a powerful aspect that can have a large impact on the readability of code. [Kent Beck] (http://en.wikipedia.org/wiki/Kent_Beck) talks about this topic quite briefly in his book [Implementation Patterns] (http://www.amazon.com/Implementation-Patterns-Kent-Beck/dp/0321413091).

<!--more-->

He breaks the problem up into three topics; **Conceptual Affinity**, **Vertical Spacing** and **Horizontal Openness and Density**.

A place where effective use of whitespace can be most powerful is in [Unit Tests] (http://en.wikipedia.org/wiki/Unit_testing). Consider the below, made up, [JUnit] (http://junit.org/) test using [Mockito] (https://code.google.com/p/mockito/). It creates some value objects, configures some mocks, executes some code and does some asserts and verifies. A typical test case when writing [Mockist Unit Tests] (http://martinfowler.com/articles/mocksArentStubs.html) using these frameworks.

<nospellcheck>
{% highlight java %}
@Test
public void shouldPersistBusinessLogicResultToTheDataAccessObject() {
  Query query = new Query();
  Result result = new Result();
  when(businessLogic.handle(query)).thenReturn(result);
  Response response = controller.doSomethingWith(query);
  assertThat(response.status(), is(OK));
  verify(dataAccessObject.persist(result));
}
{% endhighlight %}
</nospellcheck>

Conceptual Affinity is about how you group pieces of information together, _"why are these lines together?"_ _"why are they spread apart?"_ you can use whitespace in your code to communicate to the reader why certain lines of code belong together.

In the above we grouped everything together, we are essentially telling the reader that "all of these lines are a single concept and belong together" - they do in fact represent a single Unit Test, however, we could do a little better. We could group each line of code by the action they are doing. There are three actions in the above example, we [Arrange] (http://c2.com/cgi/wiki?ArrangeActAssert) (our data and mocks), we [Act] (http://c2.com/cgi/wiki?ArrangeActAssert) (execute the System Under Test, "controller") and finally we [Assert] (http://c2.com/cgi/wiki?ArrangeActAssert) (assert the result, verify the mock).

<nospellcheck>
{% highlight java %}
@Test
public void shouldPersistBusinessLogicResultToTheDataAccessObject() {
  Query query = new Query();
  Result result = new Result();
  when(businessLogic.handle(query)).thenReturn(result);

  Response response = controller.doSomethingWith(query);

  assertThat(response.status(), is(OK));
  verify(dataAccessObject.persist(result));
}
{% endhighlight %}
</nospellcheck>

At a single glance, we have allowed the reader of our code to quickly identify each of the [three A's] (http://c2.com/cgi/wiki?ArrangeActAssert). We have done this by using **Vertical Spacing**. It is a simple concept but in a large code-base it can be difference between something that is impossible to comprehend and understand and something that can be deciphered and read at a glance.

**Horizontal Openness and Density** is used all the time, you probably don't even realize it. When we indent method bodies and the body of control statements (if and while) we are using Horizontal Openness to communicate to our readers that the indented code is separate to the non indented code. We don't have do this but the simple act of doing it makes for a much more readable code base.


