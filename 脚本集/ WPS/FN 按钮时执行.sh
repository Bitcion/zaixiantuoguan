#!/bin/sh

### Custom user script
### 在按下 WPS 或 FN 按钮时调用
### $1 - button param

case "$1" in
    1)
        # 双击事件（规则更新）
        /etc/storage/script/Sh09_chinadns_ng.sh updateapp19
        ;;  # 空分支需保留`;;`符号，避免语法错误

    2)
        # 单击触发：设置NVRAM并执行脚本
        nvram set cloudflare_status=123 && /tmp/script/_cloudflare
        ;;

esac

