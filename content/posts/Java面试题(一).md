---
title: "Java面试题(一)"
date: 2021-03-12T23:55:14+08:00
draft: false
categories: [编程]
tags: [Java,面试]
---


在程序员的1-3年阶段，我们需要不断努力的学习并积累知识点，那么每个阶段都需要具备什么条件呢？请看下面：

🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

#  10k面试题
## 1.抽象类和接口的关系和区别，以及你在实际开发过程中是怎样使用的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 2.你知道反射机制和动态代理吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 3.一个线程连续两次调用start方法会发生什么？简单谈谈线程的几种状态？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 4.springmvc实现原理？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 5.mybatis中#$的区别？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 6.你知道设计模式吗？在实际运用中你会怎样去运用它？比如我这里有个策划打折活动，比如VIP，普通用户，顾客分别打不一样的折扣，你会用什么设计模式？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 7.你知道索引失效吗？举例看看？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 8.多态在实际项目中的使用？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 9.你知道Spring IOC 吗？Spring 是怎样创建对象的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 10.你知道缓存机制不？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 11.你的项目中有用到数据库分库分片吗？数据库分库分片规则？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 12.在实际中你会怎样对sql语句进行优化？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 13.常见的数据结构有哪些？在Java中是怎样使用它们的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 14.JVM原理你知道吗？有没有自己调优过？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 15.看你的项目里用到了SpringBoot，谈谈你对SpringBoot的理解？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 16.你项目里用到了 rocket MQ，那你知道rabbit MQ、rocket MQ和kafka它们之间的区别吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 17.redis常用场景有哪些？你的项目中主要是使用redis干嘛的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 18.有自己部署过redis吗？redis是如何实现高可用的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 19.了解mysql的读写分离吗？是如何实现高可用的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 20.Exception和Error的关系和区别？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 21.基本数据类型转换为String时你有几种方法，分别是什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 22.如何利用JDK不依赖外部工具，实现一个简单的缓存机制？请简述用到的技术和思路？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 23.你项目中是怎样用到事物的，分布式锁呢？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 24.Zookeeper有哪些运用场景？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>


## String 可能会问到的
```java
// 1、== 和 equals的区别？
// 建议从基本数据类型和引用数据类型以及Object和String的equals来大致说
// 2、下面代码的运行结果是？
String str1 = "Hello World";
String str2 = "Hello" + " World"; // 两个常量池的字面拼接值还是在常量池中
System.out.println(str1 == str2); // true


// 3、下面代码运行的结果是？
String str1 = "Hello World"; // 常量池
String str2 = "Hello";
str2 += " World"; // 操作了str2 是一个变量，变量是存在于 堆中的
System.out.println(str1 == str2); // false


// 4、下面代码运行的结果是？
String str1 = "Hello World";
String str2 = " World";
String str3 = "Hello" + str2;
System.out.println(str1 == str3); // false

// 5、下面代码的运行结果是？
String str1 = "Hello World";
final String str2 = " World";
String str3 = "Hello" + str2;
System.out.println(str1 == str3); // true

// 6、下面代码的运行结果是？
String str1 = "Hello World";
final String str2 = new String(" World"); //虽然用final修饰了，但是因为是采用的构造函数来实例化的，所以本身就存在于堆内存中，本身就是一个变量了
String str3 = "Hello" + str2;
System.out.println(str1 == str3); // false

// 7、下面代码的运行结果是？
String str1 = "Hello World";
String str2 = "Hello";
String str3 = " World";
String str4 = str2 + str3;
System.out.println(str4 == str1); // false
System.out.println(str4.intern() == str1); // true intern相当于是从常量池中查找是否有该值，若有则返回
```
____________________________
____________________________
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/icon/logo.gif"/>

🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀
# 15k面试题
## 1.IO/NIO的区别，为什么要用NIO，使用IO中的Buffered也能实现NIO的面向缓冲，什么情况下用NIO？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 2.熟悉的排序算法有哪些？快速排序算法的实现原理？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 3.HashMap与ConcurrentHashMap有什么区别？HashMap的存储结构？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 4.vector、ArrayList和LinkedList区别及存储性能？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 5.线程实现的几种方式，有什么区别，一般用哪个，为什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 6.多线程中线程池怎么样使用及其实现原理？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 7.volatile关键字的作用是什麽？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 8.synchronized关键字的作用，使用该关键字后保证同步了，同步代码块与同步方法有什么区别？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 9.一个线程可以多次start吗？会报错吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 10.Spring AOP IOC实现原理？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 11.Spring中的事物的传播方式怎样实现的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 12.Spring中事物实现的原理？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 13.为什么要使用数据库索引，数据库索引有哪些？索引的底层原理是什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 14.sql查询缓慢怎么处理？sql优化方案有哪些？explain用过吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 15.数据库中的锁有几种？比如行锁，表锁等了解吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 16.数据库为什么要使用事物？事物的原理是什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 17.数据库分库分表的方法，垂直分还是水平分，根据哪些来分？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 18.`count(1) count(5) count(*)`有什么区别，100万条数据的效率如何？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 19.solr搜索实现原理，使用的排序算法是什么？怎样实现快速查询？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 20.3次握手的原理是什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 21.动态代理实现原理是什么和动态代理使用的方法、类有哪些？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 22.redis的数据结构有哪些？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 23.虚拟机了解多少？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 24.Spring默认是单例还是多例的？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 25.常用的队列有哪些？分别是什么情况下使用？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 26.你知道的线程安全的类有哪些，方法有哪些？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 27.数据库的乐观锁和悲观锁的原理及使用？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 28.对GC了解多少？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 29.堆和栈的区别，堆中存放什么，栈中存放什么？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 30.用过的中间件有哪些？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

___________________________________
____________________________
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/gallery/65.jpg"/>


💄💄💄💄💄💄💄💄💄💄💄💄💄💄💄💄

# 20k面试题
## 1.你认为的“大规模高并发访问的Web”有哪些呢？请举例2个知名的网站？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 2.你开发过的核心功能有哪些呢？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 3.如果让你对外开发一个接口，你会考虑哪些因素？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 4.设计数据库的时候会考虑哪些因素，怎样去建表？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 5.说说负载均衡，缓存，文件数据库技术的心得和要点？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 6.性能评估机制有哪些方面呢，你有这方面的经验和心得吗？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 7.精通UML以及熟练使用一种或多种建模工具
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

## 8.你常去的技术网站是什么？工作中用过什么辅助软件呢？
<details>
<summary>查看提示</summary>
答案后续更新...
</details>

___________________________________
____________________________

![](https://img.imgdb.cn/item/604b8f435aedab222cefacce.jpg)
