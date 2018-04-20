#!/bin/bash
# json 字符串 转 http get请求类似的后缀 key=val&key=val

str=$(echo $1 | awk '{{printf"%s", $0}}')
output=$(/etc/alternatives/php -r "echo http_build_query(json_decode('${str}', true));")
echo -e "\033[33m ${output} \033[0m"
