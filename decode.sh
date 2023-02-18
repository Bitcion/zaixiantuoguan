#!/bin/bash

# Download and decode the GFWList
wget -qO- --no-check-certificate https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt | base64 -d > gfwlist.txt

# Modify each address in GFWList to the desired format
sed 's/^/||/' gfwlist.txt | sed 's/$/^$dnstype=~A|~CNAME/' > ipv6.txt

# Push the changes to GitHub
git add ipv6.txt
git commit -m "Update ipv6.txt"
git push origin main
