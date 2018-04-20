#!/bin/bash
updir=/home/o/jfw
todir=/
sss=`find $updir -type d -printf $todir/'%P\n'| awk '{if ($0 == "")next;print "mkdir " $0}'`
aaa=`find $updir -type f -printf 'put %p %P \n'`
ftp -nv host <<EOF
user username password
type binary
prompt
$sss
cd $todir
$aaa
quit
EOF
