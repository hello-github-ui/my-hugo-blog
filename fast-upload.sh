#!/bin/bash

echo "欢迎您于 ${date} 使用快速上传源码脚本"

git add .

git commit -m "update content on `date +'%Y-%m-%d %H:%M:%S'`"

git push origin master