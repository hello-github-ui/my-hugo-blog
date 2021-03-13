---
title: "Java代码的执行顺序"
date: 2021-03-12T22:27:01+08:00
draft: false
categories: [编程]
tags: [Java]
---

1. 静态代码的执行一定先于 main 方法，静态代码块和静态成员变量的执行顺序是由代码位置决定的，谁写前面就先执行谁

![https://img.imgdb.cn/item/602e3d51343ca1fbf9f192da.png](https://img.imgdb.cn/item/602e3d51343ca1fbf9f192da.png)

![https://img.imgdb.cn/item/602e3e82343ca1fbf9f2068b.png](https://img.imgdb.cn/item/602e3e82343ca1fbf9f2068b.png)

1. 如果是非静态代码块和非静态成员变量，不执行

![https://img.imgdb.cn/item/602e3e82343ca1fbf9f20684.png](https://img.imgdb.cn/item/602e3e82343ca1fbf9f20684.png)

![https://img.imgdb.cn/item/602e3e82343ca1fbf9f20686.png](https://img.imgdb.cn/item/602e3e82343ca1fbf9f20686.png)

只有在创建 TestOrder 对象的时候，才会执行非静态代码块和非静态成员变量

![https://img.imgdb.cn/item/602e3e82343ca1fbf9f20688.png](https://img.imgdb.cn/item/602e3e82343ca1fbf9f20688.png)

![https://img.imgdb.cn/item/602e3e82343ca1fbf9f2068b.png](https://img.imgdb.cn/item/602e3e82343ca1fbf9f2068b.png)

非静态代码块和非静态成员变量的执行顺序是由二者的顺序决定的。

1. 如果同时存在非静态代码块和静态代码块，以及非静态成员变量和静态成员变量，执行顺序是怎样呢？

先执行静态的东西，并且只执行一次；再执行非静态的东西（只有在创建对象的情况下执行），创建多少个对象就执行多少次。

1. 加入 父子类

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

![https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bf8.png](https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bf8.png)

分析：

①、首先会加载类 Parent，则 Parent 中的静态代码块和静态成员变量会优先执行。【首先会把相关的两个类加载到 JVM 内存中，然后才会创建调用对象等操作】

![https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bfb.png](https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bfb.png)

②、加载 Child，则 Child 中的静态代码块和静态成员变量会优先执行。

![https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bfd.png](https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20bfd.png)

③、类加载完成后，就开始创建对象了，先创建 Parent 对象，创建对象之前，先创建对象的资源（指非静态代码块和非静态成员变量的执行）

![https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20c00.png](https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20c00.png)

④、执行 Parent 构造器，完成对象的创建

![https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20c03.png](https://img.imgdb.cn/item/602e3e8b343ca1fbf9f20c03.png)

⑤、创建 Child 对象之前，先创建对象的资源

![https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e82.png](https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e82.png)

⑥、执行 Child 构造器，完成对象的创建

![https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e85.png](https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e85.png)

⑦、执行 sayHello 方法

![https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e87.png](https://img.imgdb.cn/item/602e3e90343ca1fbf9f20e87.png)

尽管进行了强制类型转换，但实际上对象还是内存中的 Child 对象，类型转换并不会涉及到对象的改变。
