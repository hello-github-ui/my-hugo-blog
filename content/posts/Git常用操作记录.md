---
title: Git常用操作记录
categories:
  - 编程
tags: 
  - Git
draft: false
date: 2020-06-26 21:05:03
---

# 合并远程分支到当前分支

1. ## 查看远程分支

首先要查看一下远程有哪些分支

`git branch -r`

2. ## 拉取目标远程分支到一个临时分支

此处假设我们在远程有一个 `dev` 的分支，现在我们想要将远程的 `dev` 分支与本地的 `master` 分支进行合并。

因此，我们先要拉取远程的 dev 分支代码到一个 临时分支

`git fetch origin dev:temp`

3. ## 查看当前分支与临时分支的差异

`git diff temp --name-only`

或者

`git diff temp`

4. ## 合并临时分支到当前分支

`git merge temp`

5. ## 删除临时分支

`git branch -d temp`





------

<u>*本文持续更新哦*</u>
