#!/bin/bash
# 处理git上次提交版本 打包并解压
output=$(git log $1 -p -1 --pretty=oneline --name-only | awk 'NR>1'|awk BEGIN{RS=EOF}'{gsub(/\n/," ");print}')
echo ${output}
date=`date +%Y%m%d`
str=`date +%s%N | md5sum | head -c 10`
basename=$(basename `pwd`)
filename=/var/tmp/${basename}-${date}-${str}

#将上次版本改动文件打包并解压
tar zcvf ${filename}.tgz ${output}
echo -e "\033[33m ${filename}.tgz \033[0m"
mkdir ${filename} | tar zxvf ${filename}.tgz -C ${filename}
echo -e "\033[33m ${filename} \033[0m"

filedir=/home/o/jfw
#删除指定目录下的文件
rm -rf ${filedir}/*

#将解压的文件夹转移
mv ${filename}/server ${filedir}

ftp.sh
