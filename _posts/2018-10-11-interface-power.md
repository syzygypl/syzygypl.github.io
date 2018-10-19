---
layout: post
title:  Interface Power
date:   2018-10-11
category: technology
author: frost-fox
---

In the very beginning main idea of this post was to explain why interfaces are good and show some patterns to solve 
common problems. Unfortunately while describing why they are good it becomes something like "use pure interfaces instead
of abstract classes and inheritance" or more obvious "why inheritance is bad and how to solve it". But anyway I will 
continue this topic and show the real power of interfaces.

In object-oriented programming such principles as Polymorphism and Abstraction are considered as golden rules, and we
all understand the theoretical basis of these principles and their simplistic beauty. In OOP abstraction mechanism 
allows us to think in terms of **contracts** without specifying its details at the beginning and deferring this moment
to implementation. One of the examples of abstraction is methods defined as **abstract**. Polymorphism gives us ability
to dynamically use any instance we want in terms of the desired contract if it has this contract implemented.

Sometimes abstraction is a very great tool to solve many programming problems. Imagine that you have a system with
different web pages types and you want to have the ability to generate this pages to HTML. You can create an abstract 
class and its implementation as below:
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
`generateBody`, and defined additional contract concept in our domain - so and now it is easier to understand whole 
system flow. It increases maintainability, reusability and readability.

## Undesired dependencies damage

For now, this approach with an extension of the abstract class gave us only benefits, but I want to show in which case
it may lead to design damage. Let's imagine that in some point you have added meta description to all of your pages, that 
description is stored in a database and can be acquired with a connector. Now your `WebPage` class looks like this, 
with newly created `constructor`  and `getDescription` method. And it is used while rendering `<head>` tag of your page 
somewhere in the code.

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

For now, you may say there is no any damage to code design, probably... Perhaps if you will introduce page that has no 
description taken from a database but hardcoded. Now you have to override description, but also has to pass `id` and 
`connector` to abstract class constructor even if you don't need it in context of this page. Useless in our context 
logic introduces undesired dependencies and parameters bloating. Also every time we introducing new dependency in 
`WebPage` class this change has to be done to every its implementation. That's pretty ugly.

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

By adding `getDescription` logic `WebPage` we have used **inheritance** concept, now every logic 
introduced in the parent class is inherited by its child. The main point here is that we have tried to predict the 
future and assumed that this `getDescription` will be useful for every child class. That's great when we desire to have 
this logic, but problems start to appear when this logic is not needed in some cases (as described above). 

## Interfaces

Let's introduce another example of abstraction in OOP languages. It's called **interfaces**. The main difference 
between interface and abstract class is that you are not allowed to have any implementation in interfaces. So it is a 
pure contract without any default logic. Let's see how our approach will change if we will swap abstract class to 
interfaces.

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

Here we can see that it was not possible to add `getDescription` to `WebPage` because of inability to add logic to 
interfaces, instead, we had to add it directly to the class that needed this feature. This approach saved us from 
damage described in the example with an abstract class. Let's compare this two solutions more deeply. 

## Theoretical view

Imagine how we can think of this problem in terms of contracts and their features. Let's call every contract 
methods as features, so we will get `description`,`header`, `body` features in `WebPage` contract. Now we have 
`description` feature defined in `WebPage` and `ProductWebPage` that have this features inherited, `body` and 
`header` features are abstract and therefore implemented in `ProductWebPage`.
![inheritance](inheritance.png)
But lets slightly change terms - how we can think about the description if it was abstract? Then `description` is  
same abstract feature as `header` but with default implementation that is used if the feature is not implemented in 
the child class. And that how it is reflected in our example.   
![abstract-with-default](abstract-with-default.png)
Also when we doing override we just choose not to use default implementation but create it by ourselves. That's what 
it looks like.
![abstract-with-override](abstract-with-override.png)

So the main difference between interfaces and abstract classes is default implementation, only that thing may be harmful
in then case of our design. And this was depicted in the design problem above.

## Rectangle is a Square problem

Let's investigate one more example, where inheritance don't work well. This topic is called **square is rectangle** 
problem: imagine that you have class `Rectangle` with `width` and `height` accessors and `area` calculation. Also, we 
have created class `Square`. We all know that square is just corner case of a rectangle so all rectangle calculation 
applies to square too, so square **is a** rectangle. With it in mind, we have applied inheritance to `Rectangle` and 
`Square`. Also `Square` should always has an equal size so we have modified accessors inherited from `Rectangle`. That 
what it looks like.

```java
public class Rectangle {
    private int height;
    private int width;

    public void setHeight(int height) {
        this.height = height;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getArea() {
        return width * height;
    }
}
```  
```java
public class Square extends Rectangle {

    public void setHeight(int size) {
        super.setHeight(size);
        super.setWidth(size);
    }

    public void setWidth(int size) {
        super.setHeight(size);
        super.setWidth(size);
    }
}
```

## Liskov Substitution Principle

Everything looks great now, but if somewhere in our application we will write a method that operates on `Rectangle` 
and pass square to it, we can spot a logic problem. It means that square instance does not work well in terms of 
a rectangle - we breaking the **Liskov Substitution Principle**. The principle defines that objects of a superclass 
shall be replaceable with objects of its subclasses without breaking the application.
```java
public class Main {

    public static void main(String[] args){
        Rectangle square = new Square();
        actionWithRectangle(square);
    }

    private static void actionWithRectangle(Rectangle square) {
        square.setHeight(3);
        square.setWidth(5);
        assert square.getArea() == 15; //assertion error getArea returns 25
    }

}
```

That happened because we have overridden only accessors logic and kept default `getArea` calculation. Unfortunately 
this logic was **coupled** to each other. Logic of parent class was partially modified and a default implementation 
that was encapsulated some logic previously was broken. So as you can see partial modification of default logic may lead 
to design damage. 


## Undesired public contract

Another way we can approach this problem is adding new accessors to square `Square` and not modifying old ones.
That's our new `Square`: 
```java
public class Square extends Rectangle {

    public void setSize(int size) {
        super.setHeight(size);
        super.setWidth(size);
    }
    
}
```
Can you spot the problem in that approach? I will just show you the code that demonstrates possible design damage.

```java
public class Main {

    public static void main(String[] args){
        Square square = new Square();
        actionWithRectangle(square);
        square.setSize(5);
        actionWithSquare(square);
    }

    private static void actionWithRectangle(Rectangle square) {
        square.setHeight(3);
        square.setWidth(5);
        assert square.getArea() == 15; //works well - we haven't modified parent logic
    }
    
    private static void actionWithSquare(Square square) {
        //oh strange methods are here, but they are safe, yes? 
        square.setWidth(3);
        assert square.getArea() == 9; //No, no, no... again
    }

}
```

We have assumed that `width` accessor on `Square` class will be correct in terms of logical invariants, but this 
method was implemented in a parent class and know's nothing about its child logic. And now we have opposite problem - 
our child class has got default public contract that is not working in terms of his logic.

## Cure 

So again interfaces can solve problems that emerge from default implementation. Let's create `Rectangle` interface:
```java
public interface Rectangle {
    setHeight();
    setWidth();
    getArea();
}
```

I will not show square implementation because it is pretty obvious and was shown above. But what about `Square`?
When we start creation of `Square` we can spot huge logic problem - how methods `setHeight` and `setWidth` should 
look like? 

```java
public class Square implements Rectangle {

    private int size;

    @Override
    public void setHeight(int height) {
        this.size = height;
    }

    @Override
    public void setWidth(int width) {
        this.size = width;
    }

    @Override
    public int getArea() {
        return (int) Math.pow(this.size, 2);
    }
}
```
Two setters for same thing looks weird, yes? So it is not acceptable result for us. 
If we will be simple accessors to `height` and `weight` properties then we will break encapsulation because square 
always guarantees that it has equal sides size. If you will change both height and width in every setter, setters 
will become more than simple setters. There is no straightforward way to implement them... So implementing
interface will give you sign that something is probably broken with your design.

What about a undesired public contract? Same story - if you will implement the interface and see methods that you will 
not be able to implement like `setWidth` and `setHeight` it will be easy to spot the problem. Probably in this case 
`Rectangle` should be renamed to `HasArea` and two accessors should be removed. Of course, pure contracts cannot 
completely eliminate the problem, and you can still break Liskov or get a undesired contract, but as it was explained 
earlier it is really hard, and you can do it by accident. 
  
## Default implementation problems 
To sum up, there's comprehensive list of problems you will be able to introduce with inheritance:
 * Undesired dependencies
 * Liskov Substitution Principle
 * Undesired public contract

How pure contract can deal with them:
1) We cannot inherit dependencies from `WebPage` class - parent class simply cannot have dependencies. 
2) It is harder to break Liskov - there is no ability to partially override parent logic because it simply has no logic.
3) It is harder to add undesired contract - we cannot get default logic, it's only possible to directly implement it,
which will point out to this problem.

Ooh, I suppose this was in-depth description of we using interfaces instead of abstract classes :) Be careful with 
inheritance and next time I will show you some useful tricks we can achieve with interfaces.