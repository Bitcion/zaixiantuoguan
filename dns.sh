#!/bin/bash

# 获取gfwlist
curl -L -o gfwlist.txt https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt

# 解码gfwlist
base64 -d gfwlist.txt | sed '/^\!/d;s/\*//g' | grep -E '^[a-zA-Z0-9\.-]+$' > domains.txt

# 修改域名信息为“||qq.com^$dnstype=~A|~CNAME”
sed -e 's/^/||/' -e 's/$/^$dnstype=~A|~CNAME/' domains.txt > IPV6.TXT

# 删除中间文件
rm gfwlist.txt domains.txt

# 提交更新到github
git add IPV6.TXT
git commit -m "Update IPV6.TXT"
git push
