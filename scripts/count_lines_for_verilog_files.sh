#!/bin/sh
find ./ -name "*.v" -or -name "*.sv" |xargs wc -l
echo "Total line number is: "
find ./ -name "*.v" -or -name "*.sv" |xargs cat|wc -l
echo "Total line number exclude comments and blank line is: "
find ./ -name "*.v" -or -name "*.sv" |xargs cat|grep -v -e ^[[:space:]]*$ -e ^[[:space:]]*\/\/.*$|wc -l 
find ./ -name "*.v" -or -name "*.sv" |xargs cat|grep -e ^[[:space:]]*$ -e ^[[:space:]]*\/\/.*$ > 1.txt  # |wc -l 
find ./ -name "*.v" -or -name "*.sv" |xargs cat|grep -v -e ^[[:space:]]*$ -e ^[[:space:]]*\/\/.*$ > 2.txt  # |wc -l 
echo "comments percentage is "
a=$(find ./ -name "*.v" -or -name "*.sv" |xargs cat|grep -e ^[[:space:]]*\/\/.*$|wc -l)
b=$(find ./ -name "*.v" -or -name "*.sv" |xargs cat|wc -l)
# tmp=`expr $a / $b`
# echo $tmp
echo "`bc <<< "scale=2; 100*$a/$b"`%"
