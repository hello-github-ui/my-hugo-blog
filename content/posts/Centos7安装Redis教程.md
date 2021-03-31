---
title: "Centos7安装Redis教程"
date: 2021-03-29T23:35:55+08:00
draft: false
categories: [笔记]
tags: [Redis,Centos]
---

## 安装 gcc 依赖

由于 redis 是用C语言开发的，安装之前必须先确认是否有安装gcc环境（通过输入命令：gcc -v 来确认），如果没有安装，执行以下命令进行安装：

```shell
yum install -y gcc
```

![](https://img.imgdb.cn/item/6060262c8322e6675cd2e4eb.jpg)

由于我已经安装过了，所以此处显示已安装。（注意：没有目录的强制要求，任何目录下均可）

## 下载redis包并解压

首先下载 redis-5.0.3 的包

```shell
wget http://download.redis.io/releases/redis-5.0.3.tar.gz
```

<mark>注意：我们一般都将自己下载的软件放在 /usr/local/ 目录下</mark>

![](https://img.imgdb.cn/item/606026fe8322e6675cd362c0.jpg)

可以看到我这里已经下载下来了，然后解压：

```shell
tar -zxvf redis-5.0.3.tar.gz
```

## 进入到 redis 的解压后的目录，执行编译

进入 redis 的解压后的目录，执行编译

```shell
cd redis-5.0.3
make
```

## 安装到指定目录

注意：这里我们将redis安装到指定的目录 /opt/home/redis 下了

```shell
make install PREFIX=/opt/home/redis
```

## 启动redis服务

### 前台启动方式

```shell
cd /opt/home/redis/bin
./redis-server
```

### 后台启动

从redis的源码目录中复制 redis.conf 到 redis 的安装目录（即从 /usr/local/redis-5.0.3 目录复制到 上面的 /opt/home/redis 中）

```shell
cp /usr/local/redis-5.0.3/redis.conf  /opt/home/redis/bin
```

然后修改 <mark>安装目录</mark> 下的 redis.conf 配置

```shell
vi redis.conf
设置密码：requirepass  123456
注释掉： bind 127.0.0.1
daemonize no 改为daemonize yes
```

最后执行如下命令后台启动

```shell
./redis-server redis.conf
```

如果要想关闭 redis 服务，使用如下命令即可关闭：

```shell
./redis-cli -p 6379 shutdown
```

注意上面的 6379 是你想要关闭的redis服务设置的端口（如果你修改过，此处填写你修改过后的端口即可）

## 设置开机启动

### 添加开机启动服务

```shell
vi /etc/systemd/system/redis.service
```

复制粘贴如下内容：

```shell
nit]
Description=redis-server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/redis-5.0.9/bin/redis-server /usr/local/redis-5.0.9/bin/redis.conf
PrivateTmp=true

[Install]
WantedBy=multi-user.target                       
```

### 设置开机启动

```shell
systemctl daemon-reload
systemctl start redis.service
systemctl enable redis.service
```

### 常用的操作命令

```shell
systemctl start redis.service   #启动redis服务
systemctl stop redis.service   #停止redis服务
systemctl restart redis.service   #重新启动服务
systemctl status redis.service   #查看服务当前状态
systemctl enable redis.service   #设置开机自启动
systemctl disable redis.service   #停止开机自启动
```

## 查看redis是否启动

```shell
ps -ef | grep redis
```

