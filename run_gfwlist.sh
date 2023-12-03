#!/bin/bash

# 删除旧的ipv6.txt文件
rm -f ./ipv6.txt

# 下载gfwlist2dnsmasq.sh脚本
wget https://raw.githubusercontent.com/cokebar/gfwlist2dnsmasq/master/gfwlist2dnsmasq.sh
chmod +x gfwlist2dnsmasq.sh

# 将gfwlist转换成域名列表
sh gfwlist2dnsmasq.sh -l -o ./gfwlist_domains.txt

# 将域名列表转换成dnsmasq规则并存储到ipv6.txt文件中
sed 's/.*/\|\|&\^\$dnstype\=~A\|~CNAME/' ./gfwlist_domains.txt > ./ipv6.txt

# 删除下载的脚本和域名列表文件
rm -f gfwlist2dnsmasq.sh
rm -f ./gfwlist_domains.txt

# 下载anti-ad-for-smartdns.conf文件
wget https://anti-ad.net/anti-ad-for-smartdns.conf

# 将文件里的/#改成/#4
sed -i 's/#\//#4\//' anti-ad-for-smartdns.conf
