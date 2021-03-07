---
title: vps的搭建
tags:
  - VPS
categories:
  - 编程
draft: false
date: 2017-11-04 23:48:45
---

最近一直想自己搭建一款vps使用，但是苦于一直没有时间，直到今天得空，与大家一起分享下。

# 服务商的选择
---
因为自己之前在 vultr 上还留有余额(60$呢，好几百块大洋呢😄)，所以我的服务商就选择 vultr 吧，其实他们家的服务也很稳定、速度也很快，成名已久，推荐大家使用
这一步呢，也涉及到 vultr 账号的注册、充值等步骤，但这不是重点，因此我就不写了，不清楚的可以 google

# 选择合适的服务器
---
鉴于目前的生态，我建议大家选择硅谷、洛杉矶、西雅图等地区的服务器，因为这些地区的可用 ip 相对来说多一点(有一点很重要：系统一定要选择 Centos 6 * 64)，之后常规部署即可

# ssh 客户端工具登录部署
---
选择一款适合你的 ssh 客户端工具，连接上你刚才选择的那台服务器(账号、密码等确保正确哦)
* 首先先执行如下命令，更新系统： `yum update`
* 更换系统内核：`rpm -ivh http://www.aloneray.com/wp-content/uploads/2017/03/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm`
* 继续执行：`rpm -ivh http://www.aloneray.com/wp-content/uploads/2017/03/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force`
* 重启服务器后，安装 ssr 服务端并完成部署：`wget --no-check-certificate http://www.aloneray.com/wp-content/uploads/2019/01/shadowsocksR_CN.sh && chmod +x shadowsocksR_CN.sh && ./shadowsocksR_CN.sh`
* 你只需要随便输入一个密码即可
* 默认回车，一直下一步即可
* 最会安装成功后，会有 Congratulations 信息出现，然后保存该截图到你的电脑上即可
* 接下来，还需要安装一款加速软件：`wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh`
* 关闭防火墙：`service iptables stop`
* `chkconfig iptables off`

# 配置ssr客户端
---
右击小飞机，选择编辑服务器，根据上一步的截图，依次填写你的服务器信息即可，之后就可以畅游了😂

# 常用命令

```bash
/etc/init.d/shadowsocks start # SSR启动
/etc/init.d/shadowsocks stop # SSR停止
/etc/init.d/shadowsocks restart # SSR重启
/etc/init.d/shadowsocks status # SSR状态


/serverspeeder/bin/serverSpeeder.sh restart # 重启加速软件
/serverspeeder/bin/serverSpeeder.sh start # 启动加速软件
/serverspeeder/bin/serverSpeeder.sh stop # 停止加速软件
/serverspeeder/bin/serverSpeeder.sh status # 加速软件状态
```

# 鸣谢

---

本博客参考 [**Refrain**](http://www.aloneray.com/54.html#comments) 大佬的文章，如果觉得本文章不能够解决你的问题，还可以参考 [**Jaybo's Blog**](https://strivebo.com/2019/02/12/%E7%AF%871%EF%BC%9A%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91%E6%96%B9%E5%BC%8F%E6%80%BB%E7%BB%93/) 这篇文章哦，在此深表感谢。



------

<div align="middle">女冠子·昨夜夜半
	-- 唐代：韦庄
</div>

> 昨夜夜半，枕上分明梦见。语多时。依旧桃花面，频低柳叶眉。
> 半羞还半喜，欲去又依依。觉来知是梦，不胜悲。


<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/vps的搭建/1.jpg"/>
