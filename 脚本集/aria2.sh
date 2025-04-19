#!/bin/bash
/usr/bin/aria.sh stop
list=`wget -qO- https://cf.trackerslist.com/best.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
echo ${list}
if [ -z "`grep "bt-tracker" /etc/storage/aria2_conf.sh`" ]; then
    sed -i '$a bt-tracker='${list} /etc/storage/aria2_conf.sh
    echo 添加"bt-tracker="前缀...
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /etc/storage/aria2_conf.sh
    echo 升级完成...
fi
/usr/bin/aria.sh restart

