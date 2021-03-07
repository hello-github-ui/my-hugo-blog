---
title: nginx在centos7下的安装
tags:
  - nginx
categories:
  - 编程
date: 2020-01-09 21:08:51
---

# <font color=#FF8C00>nginx是什么</font>
Nginx 是一个高性能的 HTTP 和反向代理 web 服务器，同时也提供了 IMAP/POP3/SMTP 的服务
Nginx 特点是占有内存少，并发能力强
一般来说，如果我们在项目中引入了 Nginx ，我们的项目架构可能是这样：
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/1.webp"/>
在这样的架构中 ， Nginx 所代表的角色叫做负载均衡服务器或者反向代理服务器，所有请求首先到达 Nginx 上，再由 Nginx 根据提前配置好的转发规则，将客户端发来的请求转发到某一个 Tomcat 上去
那么这里涉及到两个概念：
* 负载均衡服务器
就是进行请求转发，降低某一个服务器的压力。负载均衡策略很多，也有很多层，对于一些大型网站基本上从 DNS 就开始负载均衡，负载均衡有硬件和软件之分，各自代表分别是 F5 和 Nginx （目前 Nginx 已经被 F5 收购），早些年，也可以使用 Apache 来做负载均衡，但是效率不如 Nginx ，所以现在主流方案是 Nginx 。
* 反向代理服务器
就是对于用户来说，用户只确定我请求的是某个位置的uri资源，但是这个资源是由谁来提供给我的，用户并不需要知道。就像我们日常打电话到110一样，你会有这样的疑问，全国都是打110，那么如果我身在北京打110会不会打到上海呢？哈哈，其实这就有点类似反向代理了，我们只需要知道我们打110，但是其真实的过程是网络默认在我们拨打的号码前加入了当地基站的前缀号码的缘故。

# Nginx 的优势
在 Java 开发中，Nginx 有着非常广泛的使用，随便举几点：

1. 使用 Nginx 做静态资源服务器：Java 中的资源可以分为动态和静态，动态需要经过 Tomcat 解析之后，才能返回给浏览器，例如 JSP 页面、Freemarker 页面、控制器返回的 JSON 数据等，都算作动态资源，动态资源经过了 Tomcat 处理，速度必然降低。对于静态资源，例如图片、HTML、JS、CSS 等资源，这种资源可以不必经过 Tomcat 解析，当客户端请求这些资源时，之间将资源返回给客户端就行了。此时，可以使用 Nginx 搭建静态资源服务器，将静态资源直接返回给客户端。
2. 使用 Nginx 做负载均衡服务器，无论是使用 Dubbo 还是 Spirng Cloud ，除了使用各自自带的负载均衡策略之外，也都可以使用 Nginx 做负载均衡服务器。
3. 支持高并发、内存消耗少、成本低廉、配置简单、运行稳定等。

# Nginx 安装
因为我们日常的服务器都是选用的centos7的，所以在这里我就只介绍centos下nginx的安装，我们采用默认安装（即不主动设置安装目录）
1. 下载nginx
`wget http://nginx.org/download/nginx-1.17.0.tar.gz`
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/3.webp"/>
2. 解压
`tar -zxvf nginx-1.17.0.tar.gz `
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/4.webp"/>
3. 然后进入nginx-1.17.0目录
在编译安装之前，我们还需要安装两个依赖
`yum -y install pcre-devel`
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/5.webp"/>
和
`yum -y install openssl openssl-devel`
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/6.webp"/>
4. 编译安装
依次执行如下命令：
`./configure`、
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/7.webp"/>
`make`、
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/8.webp"/>
`make install`
安装好之后，默认的安装位置是：`/usr/local/nginx/sbin/nginx`
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/9.webp"/>
5. 启动nginx
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/10.webp"/>
进入sbin目录，启动：`cd /usr/local/nginx/sbin`、`./nginx`即可启动了
启动成功之后，我们访问本地的ip地址，即可看到如下界面：
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/2.webp"/>
看到如上页面，表示 Nginx 已经安装成功了
如果修改了 Nginx 配置，则可以通过如下命令重新加载 Nginx 配置文件：`./nginx -s reload`

# 题外话
大家都知道，现在我们的项目一般都是采用前后端分离的开发方式，而前后端分离的项目在部署时只有两种方式：
1. 一种就是将前端项目打包编译之后，放到后端项目中（例如 Spring Boot 项目的 src/main/resources/static 目录下）
2. 另外一种则是将前端打包之后的静态资源用 Nginx 来部署，后端单独部署只需要单纯的提供接口即可
一般在公司项目中，我们更多的是采用后者
在部署时，我们只需要将我们的项目打包成jar包，然后上传到服务器，然后执行该命令即可启动项目：`nohup java -jar demo.jar > demo.log &` (demo.jar 是我们打包后的包名，这只是一个例子，你替换成你的包名即可)
这样这个项目的运行日志就写入到 demo.log 文件中了

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/nginx在centos7下的安装/11.webp"/>
