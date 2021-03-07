---
categories: 
  - 编程
title: Java代码的执行顺序
draft: false
tags:
  - Java
date: 2021-01-31 22:45:23
---

## Java 代码的执行顺序

1. 静态代码的执行一定先于 main 方法，静态代码块和静态成员变量的执行顺序是由代码位置决定的，谁写前面就先执行谁

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612094756724.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612094790661.png"/>

2. 如果是非静态代码块和非静态成员变量，不执行

   <img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612096251181.png"/>



<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612096279425.png"/>

只有在创建 TestOrder 对象的时候，才会执行非静态代码块和非静态成员变量

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612096630470.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612096652784.png"/>

非静态代码块和非静态成员变量的执行顺序是由二者的顺序决定的。

3. 如果同时存在非静态代码块和静态代码块，以及非静态成员变量和静态成员变量，执行顺序是怎样呢？

   先执行静态的东西，并且只执行一次；再执行非静态的东西（只有在创建对象的情况下执行），创建多少个对象就执行多少次。

4. 加入 父子类

```java
public class Stub {

	public Stub(String str) {
		System.out.println(str + "object created");
	}
}
```

```java
public class Parent {

	static Stub parentStaticStub = new Stub("parent static object-");

	static{
		System.out.println("parent static code execute");
	}

	{
		System.out.println("parent code execute");
	}

	Stub parentStub = new Stub("parent object-");

	Stub stub;

	public Parent(){
		System.out.println("parent constructor execute");
		stub = new Stub("parent constructor create object-");
	}

	public void sayHello(){
		System.out.println("hello from parent");
	}
}
```

```java
public class Child extends Parent {

	static Stub childStaticStub = new Stub("child static object-");

	static {
		System.out.println("child static code execute");
	}

	{
		System.out.println("child code execute");
	}

	Stub childStub = new Stub("child object-");

	Stub stub;

	public Child(){
        // 子类构造器中默认会有一个 super() 父类构造器
		System.out.println("child constructor execute");
		stub = new Stub("child constructor create object-");
	}

	public void sayHello(){
		System.out.println("hello from child");
	}
}
```

```java
public class Test {
	public static void main(String[] args) {
		Child child = new Child();
		child.sayHello();
		((Parent)child).sayHello();
	}
}
```

执行结果：

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612100121766.png"/>

分析：

①、首先会加载类 Parent，则 Parent 中的静态代码块和静态成员变量会优先执行。【首先会把相关的两个类加载到 JVM 内存中，然后才会创建调用对象等操作】

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101675087.png"/>

②、加载 Child，则 Child 中的静态代码块和静态成员变量会优先执行。

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101687917.png"/>

③、类加载完成后，就开始创建对象了，先创建 Parent 对象，创建对象之前，先创建对象的资源（指非静态代码块和非静态成员变量的执行）

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101705513.png"/>

④、执行 Parent 构造器，完成对象的创建

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101717766.png"/>

⑤、创建 Child 对象之前，先创建对象的资源

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101801360.png"/>

⑥、执行 Child 构造器，完成对象的创建

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101846640.png"/>

⑦、执行 sayHello 方法

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Java代码执行顺序/1612101871816.png"/>

尽管进行了强制类型转换，但实际上对象还是内存中的 Child 对象，类型转换并不会涉及到对象的改变。
