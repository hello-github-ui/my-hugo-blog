---
title: "Python批量重命名图片"
date: 2021-03-13T11:00:27+08:00
draft: false
categories: [编程]
tags: [Python]
---

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time 2021/3/13 10:21
# @Author latin-xiao-mao
# @Version v1.0
# @File BatchRename.py

import os
import random


class BatchRename():
    def __init__(self):
        self.path = 'E:/github-project/18x-images/'     # 表示需要命名处理的文件夹
        print(self.path)

    def rename(self):
        files = os.listdir(self.path)   # 获取文件路径
        random.shuffle(files)
        print(files)
        total_num = len(files)  # 获取文件长度（个数）
        # new_filepath='/home/tanBin/deepLearning/python_learning/caiLearning/crawl_picture/tmp/'
        # if not os.path.exists(new_filepath):
        #     os.makedirs(new_filepath)

        i = 202101  # 图片开始重命名的名称

        for item in files:
            # print item
            if item.endswith('.jpg') or item.endswith('.webp') or item.endswith('.png'):    # 源文件是png格式及其他格式
                src = os.path.join(os.path.abspath(self.path), item)
                dst = os.path.join(os.path.abspath(self.path), format(str(i), '0>6s') + '.jpg')     # 处理后的格式也为jpg格式的
                os.rename(src, dst)
                print('converting %s to %s ...' % (src, dst))
                i = i + 1
        print('total %d to rename & converted %d jpgs' % (total_num, i))


if __name__ == '__main__':
    newName = BatchRename()
    newName.rename()
```
