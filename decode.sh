#!/bin/bash

# 获取 GFWList 并解码
curl -sL "https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt" | base64 -d > gfwlist.txt

# 转换 GFWList 格式为 IPv6.txt
cat gfwlist.txt | grep -v "^\!" | grep -v "^@" | sed -r 's/\^/\$dnstype=~A|~CNAME\&/' > ipv6.txt

# 提交文件到仓库并推送到 GitHub
git add ipv6.txt
git commit -m "Add IPv6.txt file"
git push origin main
