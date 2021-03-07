---
title: 使用python的you-get下载视频
categories: 
  - 随笔
tags:
  - Python
draft: false
date: 2020-07-13 12:06:12
---

# You-get 介绍
You-get是GitHub上的一个项目，也可以说是一个命令行程序，帮助大家下载大多主流网站上的视频、图片及音频。 支持的网站非常多，我们可以先来看一部分：

<table>
<thead>
<tr>
<th align="center">Site</th>
<th align="left">URL</th>
<th align="center">Videos?</th>
<th align="center">Images?</th>
<th align="center">Audios?</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><strong>YouTube</strong></td>
<td align="left"><a href="https://www.youtube.com/" rel="nofollow">https://www.youtube.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Twitter</strong></td>
<td align="left"><a href="https://twitter.com/" rel="nofollow">https://twitter.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">VK</td>
<td align="left"><a href="http://vk.com/" rel="nofollow">http://vk.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Vine</td>
<td align="left"><a href="https://vine.co/" rel="nofollow">https://vine.co/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Vimeo</td>
<td align="left"><a href="https://vimeo.com/" rel="nofollow">https://vimeo.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Veoh</td>
<td align="left"><a href="http://www.veoh.com/" rel="nofollow">http://www.veoh.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Tumblr</strong></td>
<td align="left"><a href="https://www.tumblr.com/" rel="nofollow">https://www.tumblr.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">TED</td>
<td align="left"><a href="http://www.ted.com/" rel="nofollow">http://www.ted.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">SoundCloud</td>
<td align="left"><a href="https://soundcloud.com/" rel="nofollow">https://soundcloud.com/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">SHOWROOM</td>
<td align="left"><a href="https://www.showroom-live.com/" rel="nofollow">https://www.showroom-live.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Pinterest</td>
<td align="left"><a href="https://www.pinterest.com/" rel="nofollow">https://www.pinterest.com/</a></td>
<td align="center"></td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">MTV81</td>
<td align="left"><a href="http://www.mtv81.com/" rel="nofollow">http://www.mtv81.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Mixcloud</td>
<td align="left"><a href="https://www.mixcloud.com/" rel="nofollow">https://www.mixcloud.com/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">Metacafe</td>
<td align="left"><a href="http://www.metacafe.com/" rel="nofollow">http://www.metacafe.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Magisto</td>
<td align="left"><a href="http://www.magisto.com/" rel="nofollow">http://www.magisto.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Khan Academy</td>
<td align="left"><a href="https://www.khanacademy.org/" rel="nofollow">https://www.khanacademy.org/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Internet Archive</td>
<td align="left"><a href="https://archive.org/" rel="nofollow">https://archive.org/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Instagram</strong></td>
<td align="left"><a href="https://instagram.com/" rel="nofollow">https://instagram.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">InfoQ</td>
<td align="left"><a href="http://www.infoq.com/presentations/" rel="nofollow">http://www.infoq.com/presentations/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Imgur</td>
<td align="left"><a href="http://imgur.com/" rel="nofollow">http://imgur.com/</a></td>
<td align="center"></td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Heavy Music Archive</td>
<td align="left"><a href="http://www.heavy-music.ru/" rel="nofollow">http://www.heavy-music.ru/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">Freesound</td>
<td align="left"><a href="http://www.freesound.org/" rel="nofollow">http://www.freesound.org/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">Flickr</td>
<td align="left"><a href="https://www.flickr.com/" rel="nofollow">https://www.flickr.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">FC2 Video</td>
<td align="left"><a href="http://video.fc2.com/" rel="nofollow">http://video.fc2.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Facebook</td>
<td align="left"><a href="https://www.facebook.com/" rel="nofollow">https://www.facebook.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">eHow</td>
<td align="left"><a href="http://www.ehow.com/" rel="nofollow">http://www.ehow.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Dailymotion</td>
<td align="left"><a href="http://www.dailymotion.com/" rel="nofollow">http://www.dailymotion.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Coub</td>
<td align="left"><a href="http://coub.com/" rel="nofollow">http://coub.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">CBS</td>
<td align="left"><a href="http://www.cbs.com/" rel="nofollow">http://www.cbs.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Bandcamp</td>
<td align="left"><a href="http://bandcamp.com/" rel="nofollow">http://bandcamp.com/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">AliveThai</td>
<td align="left"><a href="http://alive.in.th/" rel="nofollow">http://alive.in.th/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">interest.me</td>
<td align="left"><a href="http://ch.interest.me/tvn" rel="nofollow">http://ch.interest.me/tvn</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>755<br>ナナゴーゴー</strong></td>
<td align="left"><a href="http://7gogo.jp/" rel="nofollow">http://7gogo.jp/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>niconico<br>ニコニコ動画</strong></td>
<td align="left"><a href="http://www.nicovideo.jp/" rel="nofollow">http://www.nicovideo.jp/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>163<br>网易视频<br>网易云音乐</strong></td>
<td align="left"><a href="http://v.163.com/" rel="nofollow">http://v.163.com/</a><br><a href="http://music.163.com/" rel="nofollow">http://music.163.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">56网</td>
<td align="left"><a href="http://www.56.com/" rel="nofollow">http://www.56.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>AcFun</strong></td>
<td align="left"><a href="http://www.acfun.cn/" rel="nofollow">http://www.acfun.cn/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Baidu<br>百度贴吧</strong></td>
<td align="left"><a href="http://tieba.baidu.com/" rel="nofollow">http://tieba.baidu.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">爆米花网</td>
<td align="left"><a href="http://www.baomihua.com/" rel="nofollow">http://www.baomihua.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>bilibili<br>哔哩哔哩</strong></td>
<td align="left"><a href="http://www.bilibili.com/" rel="nofollow">http://www.bilibili.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">豆瓣</td>
<td align="left"><a href="http://www.douban.com/" rel="nofollow">http://www.douban.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">斗鱼</td>
<td align="left"><a href="http://www.douyutv.com/" rel="nofollow">http://www.douyutv.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">凤凰视频</td>
<td align="left"><a href="http://v.ifeng.com/" rel="nofollow">http://v.ifeng.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">风行网</td>
<td align="left"><a href="http://www.fun.tv/" rel="nofollow">http://www.fun.tv/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">iQIYI<br>爱奇艺</td>
<td align="left"><a href="http://www.iqiyi.com/" rel="nofollow">http://www.iqiyi.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">激动网</td>
<td align="left"><a href="http://www.joy.cn/" rel="nofollow">http://www.joy.cn/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">酷6网</td>
<td align="left"><a href="http://www.ku6.com/" rel="nofollow">http://www.ku6.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">酷狗音乐</td>
<td align="left"><a href="http://www.kugou.com/" rel="nofollow">http://www.kugou.com/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">酷我音乐</td>
<td align="left"><a href="http://www.kuwo.cn/" rel="nofollow">http://www.kuwo.cn/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">乐视网</td>
<td align="left"><a href="http://www.le.com/" rel="nofollow">http://www.le.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">荔枝FM</td>
<td align="left"><a href="http://www.lizhi.fm/" rel="nofollow">http://www.lizhi.fm/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">秒拍</td>
<td align="left"><a href="http://www.miaopai.com/" rel="nofollow">http://www.miaopai.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">MioMio弹幕网</td>
<td align="left"><a href="http://www.miomio.tv/" rel="nofollow">http://www.miomio.tv/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">MissEvan<br>猫耳FM</td>
<td align="left"><a href="http://www.missevan.com/" rel="nofollow">http://www.missevan.com/</a></td>
<td align="center"></td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">痞客邦</td>
<td align="left"><a href="https://www.pixnet.net/" rel="nofollow">https://www.pixnet.net/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">PPTV聚力</td>
<td align="left"><a href="http://www.pptv.com/" rel="nofollow">http://www.pptv.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">齐鲁网</td>
<td align="left"><a href="http://v.iqilu.com/" rel="nofollow">http://v.iqilu.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">QQ<br>腾讯视频</td>
<td align="left"><a href="http://v.qq.com/" rel="nofollow">http://v.qq.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">企鹅直播</td>
<td align="left"><a href="http://live.qq.com/" rel="nofollow">http://live.qq.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Sina<br>新浪视频<br>微博秒拍视频</td>
<td align="left"><a href="http://video.sina.com.cn/" rel="nofollow">http://video.sina.com.cn/</a><br><a href="http://video.weibo.com/" rel="nofollow">http://video.weibo.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Sohu<br>搜狐视频</td>
<td align="left"><a href="http://tv.sohu.com/" rel="nofollow">http://tv.sohu.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Tudou<br>土豆</strong></td>
<td align="left"><a href="http://www.tudou.com/" rel="nofollow">http://www.tudou.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">虾米</td>
<td align="left"><a href="http://www.xiami.com/" rel="nofollow">http://www.xiami.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center">✓</td>
</tr>
<tr>
<td align="center">阳光卫视</td>
<td align="left"><a href="http://www.isuntv.com/" rel="nofollow">http://www.isuntv.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>音悦Tai</strong></td>
<td align="left"><a href="http://www.yinyuetai.com/" rel="nofollow">http://www.yinyuetai.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><strong>Youku<br>优酷</strong></td>
<td align="left"><a href="http://www.youku.com/" rel="nofollow">http://www.youku.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">战旗TV</td>
<td align="left"><a href="http://www.zhanqi.tv/lives" rel="nofollow">http://www.zhanqi.tv/lives</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">央视网</td>
<td align="left"><a href="http://www.cntv.cn/" rel="nofollow">http://www.cntv.cn/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">Naver<br>네이버</td>
<td align="left"><a href="http://tvcast.naver.com/" rel="nofollow">http://tvcast.naver.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">芒果TV</td>
<td align="left"><a href="http://www.mgtv.com/" rel="nofollow">http://www.mgtv.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">火猫TV</td>
<td align="left"><a href="http://www.huomao.com/" rel="nofollow">http://www.huomao.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">阳光宽频网</td>
<td align="left"><a href="http://www.365yg.com/" rel="nofollow">http://www.365yg.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">西瓜视频</td>
<td align="left"><a href="https://www.ixigua.com/" rel="nofollow">https://www.ixigua.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">新片场</td>
<td align="left"><a href="https://www.xinpianchang.com//" rel="nofollow">https://www.xinpianchang.com//</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">快手</td>
<td align="left"><a href="https://www.kuaishou.com/" rel="nofollow">https://www.kuaishou.com/</a></td>
<td align="center">✓</td>
<td align="center">✓</td>
<td align="center"></td>
</tr>
<tr>
<td align="center">抖音</td>
<td align="left"><a href="https://www.douyin.com/" rel="nofollow">https://www.douyin.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">TikTok</td>
<td align="left"><a href="https://www.tiktok.com/" rel="nofollow">https://www.tiktok.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">中国体育(TV)</td>
<td align="left"><a href="http://v.zhibo.tv/" rel="nofollow">http://v.zhibo.tv/</a> <a href="http://video.zhibo.tv/" rel="nofollow">http://video.zhibo.tv/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td align="center">知乎</td>
<td align="left"><a href="https://www.zhihu.com/" rel="nofollow">https://www.zhihu.com/</a></td>
<td align="center">✓</td>
<td align="center"></td>
<td align="center"></td>
</tr>
</tbody>
</table>



# 下载安装python-3.7及以上

## 安装

```bash
pip3 install you-get
```

## 升级

```bash
python -m pip install --upgrade pip
```

## 修改下载源

* 豆瓣源

```bash
pip3 install you-get -i https://pypi.douban.com/simple
```

* 清华大学源

```bash
pip3 install you-get -i https://pypi.tuna.tsinghua.edu.cn/simple
```

# 使用

在目标目录中打开cmd，然后按照如下格式如入即可：

```bash
you-get https://www.bilibili.com/video/BV16C4y187S9 --playlist
```

# 获取帮助

```bash
you-get --help
```

___

**you-get项目**：https://pypi.org/project/you-get/



***更多内容请参考：https://blog.csdn.net/wzl505/article/details/105099324/ 或者 https://coco56.blog.csdn.net/article/details/106739521***
