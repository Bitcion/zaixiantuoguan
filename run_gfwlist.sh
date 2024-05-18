#!/bin/bash

# 删除旧的ipv6.txt文件
rm -f ./ipv6.txt

# 下载gfwlist2dnsmasq.sh脚本
wget https://raw.githubusercontent.com/cokebar/gfwlist2dnsmasq/master/gfwlist2dnsmasq.sh
chmod +x gfwlist2dnsmasq.sh

# 将gfwlist转换成域名列表
sh gfwlist2dnsmasq.sh -l -o ./gfwlist_domains.txt

# 将域名列表转换成dnsmasq规则并存储到ipv6.txt文件中
sed 's/.\*/\\|\\|&\\^\\$dnstype\\=~A\\|~CNAME/' ./gfwlist_domains.txt > ./ipv6.txt

# 删除下载的脚本和域名列表文件
rm -f gfwlist2dnsmasq.sh
rm -f ./gfwlist_domains.txt

# 初始化一个关联数组来存储已有规则
declare -A existing_rules

# 从AdGuard规则.txt中读取已有规则
while read -r line; do
    existing_rules["$line"]=1
done < AdGuard规则.txt

# 从ipv4.txt中读取域名并转换为Adguard规则格式
while read -r line; do
    rule="||$line^$dnstype=~A|~CNAME"
    # 检查规则是否已存在
    if [[ -z "${existing_rules["$rule"]}" ]]; then
        echo "$rule" >> adguard_rules.txt
    fi
done < ipv4.txt

# 将新规则追加到AdGuard规则.txt
cat adguard_rules.txt >> AdGuard规则.txt
rm adguard_rules.txt
