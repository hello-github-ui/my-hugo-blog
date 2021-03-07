---
title: Hello-Annie
categories:
  - 编程
tags:
  - Annie
  - 博客主题
draft: false
date: 2020-05-17 23:17:52
---


# Annie theme
Annie是一个简单的Hexo博客主题，如果你喜欢散文、诗歌、小说......那么它可能合你心意!  [☞预览-1](https://sariay.github.io/2019/03/12/相册主题Dream介绍/)，[☞预览-2](https://sariay.github.io/hexo-theme-Annie/)

### Features

1. 文艺、优雅、简洁的博客主题
2. 页头随机背景+文章缩略图背景
3. 两种主页模板，主页文章无限加载
4. 分类页、标签页点击指定分类、标签后，查询并展示相关文章
5. 相册页可以分类、搜索图片
6. 相关文章模块：文章页展示与该篇文章相关的系列文章
7. 文章评论模块：gitalk 、valine 、livere
8. 文章分享模块：addThis 、baiduShare 、shareThis 、socialShare
9. 文章统计模块：leancloud 、busuanzi
10. 文章点赞模块：leancloud
11. 文章阅读模块：toc目录、进度条、进度百分比
12. 文章代码模块：代码复制、代码语言提示、5种高亮主题（[Refer & use Next' theme](https://github.com/iissnan/hexo-theme-next/)）
13. 文章Markdown：支持数学公式(MathJax)，color quote([Refer & use Minos' theme](https://github.com/ppoffice/hexo-theme-minos/blob/master/scripts/99_tags.js))
14. 站点分析模块：baidu_analytics 、cnzz_analytics 、google_analytics 、tencent_analytics:
15. 站点文章搜索：local search
16. 多语言支持：中文简体、中文繁体、英文

### Get started

### Installation

```bash
git clone https://github.com/Sariay/hexo-theme-Annie.git
```
然后，将站点目录下的`_config.yml`文件中的`theme`字段修改为Annie。

确保**themes**目录下存在名为Annie的文件夹（hexo-theme-Annie→Annie）

### Site config

原则上，你应该编辑站点目录下的`_config.yml`文件。

- [x] **语言支持**

```yml
# Site
title: SARIAY-Blog
subtitle:
description:
keywords:
author: Sariay
language:
timezone:
```

设置`language`的值：`en | zh-CN |zh-TW`

- [x] **站内搜索**

第一步：安装 ```hexo-generator-search-zip```插件

```bash
$ npm install hexo-generator-search-zip --save
```

第二步：编辑站点目录下的`_config.yml`文件

```yml
# 添加下列参数

search:
  path: search.json
  zipPath: search.zip
  versionPath: searchVersion.txt
  field: post
  #field: post, page or all
```

第三步：编辑主题目录下的`_config.yml`文件

```yml
# 添加下列参数(若不存在)，并将enable置为true！

# Local search
# Dependencies: https://github.com/flashlab/hexo-generator-search
local_search:
    enable: true
    # if auto, trigger search by changing input
    # if manual, trigger search by pressing enter key or search button
    trigger: auto
    # show top n results per article, show all results by setting to -1
    top_n_per_article: 2
```

- [x] **代码高亮**

基于hexo自身的代码块解析插件的特性，弃用[hexo-prism-plugin](https://github.com/ele828/hexo-prism-plugin)，参考、使用next主题的代码风格。

1. `highlight、line_number`的值应为`true`

```yml
# Writing
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
post_asset_folder: true
relative_link: false
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: false
  tab_replace:
```

2. 设置`highlight_theme、code_copy`（主题目录的config.yml）

```yml
# post_code
# normal | night | night blue | night bright | night eighties
highlight_theme: night bright
code_copy:
    enable: true
```

### Theme config

你可以阅读文章 [《Annie主题使用说明》](https://sariay.github.io/2018/08/27/Annie主题使用说明/) 获取相关模块的信息，例如页头背景、相册、评论、文章点赞 !

### Post config

每一篇文章都可以设置一张特色图，该特色图将用于主页（文章缩略图）和文章详情页（页头背景）。

文章的模板样例如下，cover即为文章封面图的路径，你可以使用相对路径或绝对路径。

```markdown
---
title: {{ title }}
date: {{ date }}
cover: https://.../
categories: categories
tags: tags
---
```

### Theme update

如果你使用主题后，几乎未改动代码，那么可以使用下面的`命令行`更新主题。

```bash
cd themes/Annie
git pull
```


<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/453ff0af53.webp" alt="美图欣赏" width="100" height="100"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/1172db5000.webp" alt="美图欣赏" width="100" height="100"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/6784a868ly4gc04pnh4flj20m80xcgqg.webp" alt="美图欣赏" width="100" height="100"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/224805a410.webp" alt="美图欣赏" width="100" height="100"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/20200529404504.webp" alt="美图欣赏" width="100" height="100"/>

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/collection-gallery/20200529404514.webp" alt="美图欣赏" width="100" height="100"/>
