#!/bin/bash

output=$(/etc/alternatives/php /home/o/www/supperCool/tool/table_info.php $1 $2)
echo -e "\033[33m ${output} \033[0m"
