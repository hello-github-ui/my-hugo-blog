#!/bin/bash
time1=$(date)
echo "欢迎您于 $(time1) 使用快速上传源码脚本"

git add .

git commit -m 'update content on $(time1)'

git push origin master