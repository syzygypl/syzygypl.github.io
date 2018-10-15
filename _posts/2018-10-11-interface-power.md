---
layout: post
title:  Interface Power
date:   2018-10-11
category: technology
author: frost-fox
---

### Abstraction and polymorphism

In the very beginning main idea of this post was to explain why interfaces are good and show some patterns to solve 
common problems. Unfortunately while describing why they are good it becomes something like "use pure interfaces instead
of abstract classes and inheritance". But, anyway, I will continue this topic and after will show real power of 
interfaces.

In object oriented programming such principles as Polymorphism and Abstraction are considered as golden rules, and we
all understand theoretical basis of this principles and their simplistic beauty. Abstraction allows us to create 
functions defined as **abstract**, without specifying it's details at the beginning and deferring this moment to 
implementation, creating so called **contract**. Polymorphism gives us ability to dynamically use any instance we want 
in terms of desired contract if it has this contract implemented.

Sometimes abstraction is very great tool to solve many programming problems. Imagine that you have system with
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
`generateBody`, and defined additional contract concept in our domain - so and now it is easier to understand whole 
system flow. It increases maintainability, reusability and readability.

### Undesired dependencies damage

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

By adding `getDescription` logic `WebPage` we have used **inheritance** concept, now every logic 
introduced in parent class is inherited by it's child. Main point here is that we have tried to predict the future and 
assumed that this `getDescription` will be useful for every child class. That's great when we desire to have this logic, 
but problems start to appear when this logic is not needed in some cases (like described above). 

### Theoretical view

Imagine how we can think of this problem in terms of contracts and their features. Lets call every contract 
methods as features, so we will get `description`,`header`, `body` features in `WebPage` contract. Now we have 
`description` feature defined in `WebPage` and `ProductWebPage` that have this features inherited, `body` and 
`header` features are abstract and therefore implemented in `ProductWebPage`.
![inheritance](/assets/content/interface-power/inheritance.png)
But lets slightly change terms - how we can think about description if it was abstract? Then `description` is  
same abstract feature as `header` but with default implementation that is used if feature is not implemented in child
class. And that how it is reflected in our example.   
![abstract-with-default](/assets/content/interface-power/abstract-with-default.png)
Also when we doing override we just choose not to use default implementation but create it by ourselves. That's what 
it looks like.
![abstract-with-override](/assets/content/interface-power/abstract-with-override.png)

So main difference of pure abstraction and inheritance is that default implementation, only that thing may be harmful
in case of our design. And this was depicted in design problem above.
 
### Rectangle is a Square problem

Another problem that we can face with inheritance is so called square rectangle problem: you have class `Rectangle` 
with `width` and `height` accessors and `area` calculation. Also we have created class `Square`. We all know that 
square is just corner case of rectangle so all rectangle calculation apply to square too, so square **is a** 
rectangle. With in mind we have applied inheritance to `Rectangle` and `Square`. Also `Square` should always has 
equal size so we have modified accessors inherited from `Rectangle`. That what it looks like.

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

### Liskov Substitution Principle

Everything looks great now, but if somewhere in our application we will write method that operates on `Rectangle` 
and pass square to it, we can spot logic problem. It means that square instance don't works well in terms of 
rectangle - we breaking the **Liskov Substitution Principle**.
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

That happened because we have overridden only accessors logic and kept default`getArea` calculation. Unfortunately 
this logic was **coupled** to each other. Logic of parent class was partially modified and default implementation that 
was encapsulated some logic previously was broken. So as you can see partial modification of default logic may lead 
to design damage.

### Undesired public contract

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
Can you spot problem in that approach? I will just show you the code that demonstrates possible design damage.

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
method was implemented in parent class and know's nothing about it's child logic. And now we have opposite problem - 
our child class has got default public contract that is not working in terms of his logic.

### Default implementation problems 
To sum up, there's comprehensive list of problems you will be able to introduce with inheritance:
 * Undesired dependencies
 * Liskov Substitution Principle
 * Undesired public contract

### Cure
All this problems came from default implementation in parent class - inheritance. And there is a way to keep all good
properties of OOP such as abstraction and polymorphism and discard inheritance. We have to apply some restriction. 
Everybody knows term in programming called **interface**. Interface is class only with abstract methods - in other 
terms, **pure contract** without any ability to add default implementation. Lets see what result we can 
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
1) We cannot inherit dependencies from `WebPage` class - parent class simply cannot have dependencies. 
2) It is harder to break Liskov - there is no ability to partially override parent logic because it simply has no logic.
3) It is harder to add undesired contract - we cannot get default logic, it's only possible to directly implement it,
which will point out to this problem.

Of course it's still possible to do so. Like you can implement `fly` method from `Bird` contract in `Penguin` class. 
But you have to do knowingly, and you cannot get this problem by default because of careless.

Ooh, I suppose this was in depth description of we using interfaces instead of abstract classes :) Be careful with 
inheritance and next time I will show you some useful tricks we can achieve with interfaces.