---
layout: post
title:  Interface Power
date:   2018-10-11
category: technology
author: frost-fox
---

### Abstraction and polymorphism

In object oriented programming such principles as Polymorphism and Abstraction are considered as golden rules, and we
all understand theoretical basis of this principles and their simplistic beauty. Abstraction allows us to create 
functions defined as **abstract**, without specifying it's details at the beginning and deferring this moment to 
implementation, creating so called **contract**. Polymorphism gives us ability to dynamically use any instance we want 
in terms of desired contract if it has this contract implemented.

Sometimes abstract functions is very great tool to solve many programming problems. Imagine that you have system with
different web pages types and you want to have ability to generate this pages to html. You can create abstract class 
and its implementation as below:
```java
public abstract class WebPage {
    
    public abstract String generateHeader();

    public abstract String generateBody();

}
```
```java
public class IndexPage extends WebPage {
    @Override
    public String generateHeader() {
        return "<header></header>";
    }

    @Override
    public String generateBody() {
        return "<body></body>";
    }
}
```

Now if in your application you will operate only on `WebPage` instances, it will be easy to add any new web page type
you desire. Also we have designed additional api that depends on abstract contract - `generateHeader` and 
`generateBody`, and defined additional contract concept to our domain - so and now it is easier to understand whole 
system flow. It increases maintainability, reusability and readability.

For now this approach with extension of abstract class gave us only benefits, but I want to show in which case it may 
lead to design damage. Lets imagine that in some point you have added meta description to all of your pages, that 
description is stored in database and can be acquired with connector. Now your `WebPage` class looks like this, with 
newly created `constructor`  and `getDescription` method. And it is used while rendering `<head>` tag of your page 
somewhere in code.

```java
public abstract class WebPage {
    
    private final Integer id;
    private final DatabaseConnector connector;

    public WebPage(Integer id, DatabaseConnector connector) {
        this.id = id;
        this.connector = connector;
    }

    public String getDescription() {
        return connector.getDescription(id);
    }
    
    //generate methods ...
}
```

For now you may say there is no any damage to code design, probably... Perhaps if you will introduce page that has no 
description taken from database but hardcoded. Now you have to override description, but also has to pass `id` and 
`connector` to abstract class constructor even if you don't need it in context of this page. Useless in our context 
logic introduces undesired dependencies and parameters bloating. Also every time we introducing new dependency in 
`WebPage` class this change has to be done to every it's implementation. That's pretty ugly.

```java
public class IndexWebPage extends WebPage {
    public IndexWebPage(Integer id, DatabaseConnector connector) {
        super(id, connector);
    }

    @Override
    public String getDescription() {
        return "hardcoded description";
    }

    @Override
    public String generateHeader() {
        return "<header></header>";
    }

    @Override
    public String generateBody() {
        return "<body></body>";
    }
}
```

By adding `getDescription` logic `WebPage` we have used **inheritance** concept in programming language, now every logic 
introduced in parent class is inherited by it's child. Main point here is that we have tried to predict the future and 
assumed that this `getDescription` will be useful for every child class. That's great when we desire to have this logic, 
but problems start to appear when this logic is not needed in some cases (like described above). There's more 
comprehensive list of problems you will be able to introduce with inheritance:
 * Undesired behaviour and dependencies
 * Large inheritance chain refactoring and hidden logic problems
 * Parent and Child coupling and breaking encapsulation with `protected` properties
 * Liskov Substitution Principle
 
### Cure
There is a way how you can reduce damage of Liskov in your code and completely omit inheritance chains and Parent and
Child coupling. Everybody knows term in programming called **interface**. Interface is class only with abstract 
methods - in other terms, **pure contract** without any ability to add implementation. Lets see what result we can 
achieve using pure interfaces.

```java
public interface WebPage {
    String getDescription();
    String generateHeader();
    String generateBody();
}
```
```java
public class IndexWebPage implements WebPage {
    public IndexWebPage(Integer id, DatabaseConnector connector) {
        super(id, connector);
    }

    @Override
    public String getDescription() {
        return connector.getDescription(id);
    }

    @Override
    public String generateHeader() {
        return "<header></header>";
    }

    @Override
    public String generateBody() {
        return "<body></body>";
    }
}
```
```java
public class ProductPage implements WebPage {
    @Override
    public String getDescription() {
        return "Hardcoded description";
    }

    @Override
    public String generateHeader() {
        return "<header></header>";
    }

    @Override
    public String generateBody() {
        return "<body></body>";
    }
}
```
This approach will leave abstraction and polymorphism to serve us, but will remove any inheritance.
What we can see here:
1) We cannot inherit undesirable logic and dependencies from `WebPage` class - it simply can't have logic. 
2) There is no inheritance chains - we can't implement classes, only pure interfaces.
3) Interface has only public contract, there is no implementation and `protected` methods, so we can break 
encapsulation and coupling by introduce shared state.
Liskov is little harder to omit. But I have one assumption: "It is harder to break Liskov in case of 
interfaces". Remember [square is a rectangle problem](http://cafe.elharo.com/programming/a-square-is-not-a-rectangle/)?
By introducing inheritance from `Square` to `Rectangle` we haven't noticed that it have `setWidth` and `setHeight` 
that was not contract but concrete implementation. If `Rectangle` would be interface when implementing it in `Square`
we have to implement this two accessors too, that definitely suggests us the problem with design. So main problems 
with Liskov were introduced because of inheritance, and we completely eliminated inheritance in our 2 approach.

In the very beginning main idea of this post was to show why interfaces are good and show some patterns to solve 
common problems. Unfortunately it becomes something like "use pure interfaces instead of abstract classes". 
But anyway I will continue this topic and show real power of interfaces.