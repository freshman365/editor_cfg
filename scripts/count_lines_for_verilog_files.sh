#!/bin/sh
echo "Total line number is: "
find ./ -name "*.v" -or -name "*.sv" |xargs cat|wc -l
echo "Total line number exclude comments and blank line is: "
find ./ -name "*.v" -or -name "*.sv" |xargs cat|grep -v -e ^$ -e ^\s*\/\/.*$|wc -l
