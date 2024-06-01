#!/bin/bash

# 删除旧的AdGuard.txt文件
rm -f ./AdGuard.txt

# 从ipv4.txt中读取域名并转换为Adguard规则格式,写入AdGuard.txt
while read -r line; do
    # 直接写入$dnstype变量的文字
    rule="||$line^\\\$dnstype=~A|~CNAME"
    echo "$rule" >> AdGuard.txt
done < ipv4.txt
