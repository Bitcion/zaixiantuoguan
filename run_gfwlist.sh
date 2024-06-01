#!/bin/bash

# 删除旧的 AdGuard.txt 文件
rm -f ./AdGuard.txt

# 从 ipv4.txt 中读取域名并转换为 AdGuard 规则格式,写入 AdGuard.txt
while read -r line; do
    rule="||$line^$dnstype=~A|~CNAME"
    echo "$rule" >> AdGuard.txt
done < ipv4.txt
