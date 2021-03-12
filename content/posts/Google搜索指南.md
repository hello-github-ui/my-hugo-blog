---
title: "Google搜索指南"
date: 2021-03-12T23:46:27+08:00
draft: false
categories: [笔记]
tags: [记录]
---

# 精确搜索：双引号

> 精确搜索就是在你要搜索的词上，加上双引号，这时google就会完全的匹配你所要搜索的字符串
`"今日黄瓜"`

# 站内搜索：site
> 例如我想在stackoverflow中搜索spring boot，如下输入即可：
`site:stackoverflow.com spring boot` 【输不输入请求协议均可，当然你也可以这样: site:https://stackoverflow.com spring boot】

# 通配符搜索：*
> 例如我想搜索所有包含 熔炉 的网页，此时就可以这样搜索：
`* 熔炉` ， 此时就会出现所有开头任意字符串，但是一定包含关键词熔炉的结果。【可以想象sql语句中的模糊匹配哦】

# 过滤掉某些条件：-
> 例如我想搜索一下 人口，但是想排除掉包含有中国的字样，可以如下使用：
> `人口 -中国`

# 搜索文档：filetype
> 例如我想搜索关于 golang 语言的pdf文档，应该如下搜索：
> `filetype:pdf golang`


![](https://img.imgdb.cn/item/604b8d115aedab222cee6950.png)
