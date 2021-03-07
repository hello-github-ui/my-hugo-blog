---
title: springboot-vue-demo-01
tags:
  - springboot
  - vue
categories:
  - 编程
draft: false
date: 2020-06-14 23:39:28
---

# 新建Vue3前端项目

## 先删除之前的vue2版本

`npm uninstall -g vue-cli`

## 安装新的vue cli 包

`npm install -g @vue/cli`

安装完成后使用命令：`vue -V` 检查是否安装成功

## 构建项目

这里我们使用 `vue3` 提供的图形化界面操作：

打开 `cmder`，输入 `vue  ui`

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/10.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/11.png"/>


默认操作即可了

## 安装依赖

`yarn `

## 单页面spa应用

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/13.png"/>

## 启动项目

`yarn run serve`

单独运行成功，可以在  `/src/views/` 自己再编写一个 Book.vue 页面，然后在 `/src/router/index.js` 中进行注册，使用即可

```vue
<template>
    <div>
        <table>
            <tr>
                <td>编号</td>
                <td>封面url</td>
                <td>书名</td>
                <td>作者</td>
                <td>出版日期</td>
            </tr>
            <tr v-for="item in books">
                <td>{{item.id}}</td>
                <td>{{item.cover}}</td>
                <td>{{item.title}}</td>
                <td>{{item.author}}</td>
                <td>{{item.date}}</td>
            </tr>
        </table>
    </div>
</template>

<script>
    export default {
        name: "Book",
        data(){ // data是一个函数对象
            return{
                books: [
                    {
                        id: 1,
                        cover: 'https://i.loli.net/2019/04/10/5cadaa0d0759b.jpg',
                        title: '红楼梦',
                        author: '清婉儿',
                        date: '2020-06-14'
                    },
                    {
                        id: 2,
                        cover: 'https://i.loli.net/2019/04/10/5cadaa0d0759b.jpg',
                        title: '那一夜',
                        author: '卓文君',
                        date: '2020-06-14'
                    },
                    {
                        id: 3,
                        cover: 'https://i.loli.net/2019/04/10/5cadaa0d0759b.jpg',
                        title: '飞上你的床',
                        author: '上官飞燕',
                        date: '2020-06-14'
                    }
                ]
            }
        }
    }
</script>

<style scoped>

</style>

```

```vue
import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

// 引入 Book.vue
import Book from '../views/Book'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/about',
        name: 'About',
        // 下面这是 vue3 的写法，这里我们还用vue2的写法注册组件
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
    },
    {
        path: '/book',
        component: Book
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router

```

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/12.png"/>




# 编写后端spring boot 代码
## 新建一个spring boot 工程

## 按照下图所示完成工程的创建

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/01.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/02.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/03.png"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/04.png"/>


## 配置 application.yml

```yaml
spring:
    datasource:
        url: jdbc:mysql://localhost:3306/virgin show?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC
        username: root
        password: 123456
        driver-class-name: com.mysql.cj.jdbc.Driver
    jpa:
        show-sql: true
        properties:
            hibernate:
                format_sql: true
server:
    port: 8181
```

注意这里采用这张表的数据

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/05.png"/>


## 编写实体类

```java
package com.springboot.demo.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @author: latinos-bub
 * @date: 2020/6/14 20:51
 * @description:
 * @className: Book
 */
@Entity // 采用jpa依赖后，使用该注解，会自动将该类与数据库中的相同名字的表进行映射(注意：类与表名必须一样，首字母除外)
@Data // lomback 自动提供getter/setter
public class Book {

	@Id // 标注 数据库表中的主键字段
	private Integer id;
	String cover;
	String title;
	String author;
	String date;

    // ... 这里的字段属性最多可以等于 表的字段，这里我们只取5个演示即可

}

```

## 编写接口

```java
package com.springboot.demo.repository;

import com.springboot.demo.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author: latinos-bub
 * @date: 2020/6/14 20:55
 * @description:
 * @className: BookRepository
 */
public interface BookRepository extends JpaRepository<Book, Integer> {
}
```

在接口中，我们这里只需要继承 `JpaRepository<T, id>` 接口即可，同时也不需要注解该接口是 `@Repository`，以为继承的接口中已经说明了

## 编写测试接口类

我们打开 `JpaRepository` 会发现有好多方法，这里我们只测试一下 `findAll` 方法

首先我们在 `BookRepository` 上右键：

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/06.png"/>

这样就新建了一个测试类



```java
package com.springboot.demo.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class BookRepositoryTest {

	@Autowired // 一定要将接口注入
	private BookRepository book;

	@Test
	void findAll(){

		System.out.println(book.findAll());

	}
}
```

## 运行测试即可

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/07.png"/>


## 编写控制器

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/08.png"/>


```java
package com.springboot.demo.controller;

import com.springboot.demo.entity.Book;
import com.springboot.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author: latinos-bub
 * @date: 2020/6/14 21:53
 * @description:
 * @className: BookHandler
 */
@RestController // restful 风格的 controller
@RequestMapping("/book")
public class BookHandler {


	@Autowired // 一定要自动注入这个 接口
	private BookRepository bookRepository;


	@GetMapping("/findAll") // spring boot 独有的
	public List<Book> findAll(){

		return bookRepository.findAll();
	}
}
```

## 运行findAll 控制方法

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/09.png"/>


# 打通 springboot 和 vue

## 先在 前端项目中安装 `axios` 模块

`vue add axios`

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/14.png"/>


安装成功后，会自动显示在 `/src/plugins/axios.js`

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/15.png"/>


## 改造 `Book.vue`

在 vue 的生命周期中，`created` 的初始化先于 `data()` 函数，因此我们就在 `created` 中实现数据的请求

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/17.png"/>


## 跨域配置

我们选择在spring boot 后端进行配置

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/16.png"/>


## 运行截图

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/springboot-vue-demo/18.png"/>
