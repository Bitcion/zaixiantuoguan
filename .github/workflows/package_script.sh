#!/bin/bash

INPUT_FILE="gfwDLC.txt"
IPV4_OUTPUT="ipv4.txt"
ADGUARD_OUTPUT="AdGuard.txt"
MARKER="#自定义gfw,直接在下面添加"

# 检查输入文件是否存在
[ ! -f "$INPUT_FILE" ] && { echo "错误: $INPUT_FILE 不存在"; exit 1; }

# 处理输入文件：移除开头的 +.
TEMP_FILE=$(mktemp)
sed 's/^+\.//' "$INPUT_FILE" > "$TEMP_FILE"

# ==================== 处理 ipv4.txt ====================
if [ ! -f "$IPV4_OUTPUT" ]; then
    {
        echo "#屏蔽ipv6,在gfwDLC.txt中添加"
        cat "$TEMP_FILE"
        echo "$MARKER"
        echo ""
    } > "$IPV4_OUTPUT"
    echo "已创建 $IPV4_OUTPUT"
else
    # 查找标记行
    line_num=$(grep -n "^#自定义gfw" "$IPV4_OUTPUT" | head -1 | cut -d: -f1)
    
    if [ -n "$line_num" ]; then
        # 提取旧的 GFW 列表部分
        OLD_GFW=$(mktemp)
        head -n $((line_num - 1)) "$IPV4_OUTPUT" | \
            grep -v '^#' | \
            grep -v '^$' > "$OLD_GFW"
        
        # 提取现有的自定义域名部分
        EXISTING_CUSTOM=$(mktemp)
        tail -n +$((line_num + 1)) "$IPV4_OUTPUT" | \
            grep -v '^#' | \
            grep -v '^$' > "$EXISTING_CUSTOM"
        
        # 找出从 GFW 列表中被移除的域名
        REMOVED_DOMAINS=$(mktemp)
        while IFS= read -r domain; do
            [ -z "$domain" ] && continue
            if ! grep -Fxq "$domain" "$TEMP_FILE"; then
                grep -Fxq "$domain" "$EXISTING_CUSTOM" || echo "$domain"
            fi
        done < "$OLD_GFW" > "$REMOVED_DOMAINS"
        
        # 合并自定义域名
        FINAL_CUSTOM=$(mktemp)
        cat "$EXISTING_CUSTOM" "$REMOVED_DOMAINS" | sort -u > "$FINAL_CUSTOM"
        
        # 重建 ipv4.txt
        {
            echo "#屏蔽ipv6,在gfwDLC.txt中添加"
            cat "$TEMP_FILE"
            echo "$MARKER"
            echo ""
            cat "$FINAL_CUSTOM"
        } > "$IPV4_OUTPUT"
        
        rm "$OLD_GFW" "$EXISTING_CUSTOM" "$REMOVED_DOMAINS" "$FINAL_CUSTOM"
        echo "已更新 $IPV4_OUTPUT"
    else
        echo "警告: 未找到自定义标记，重建 $IPV4_OUTPUT"
        {
            echo "#屏蔽ipv6,在gfwDLC.txt中添加"
            cat "$TEMP_FILE"
            echo "$MARKER"
            echo ""
        } > "$IPV4_OUTPUT"
    fi
fi

# ==================== 生成 AdGuard.txt ====================
ADGUARD_TEMP=$(mktemp)

# 转换格式：domain -> ||domain^$dnstype=~A|~CNAME
while IFS= read -r domain; do
    [ -z "$domain" ] && continue
    echo "||${domain}^\$dnstype=~A|~CNAME"
done < "$TEMP_FILE" > "$ADGUARD_TEMP"

# 写入 AdGuard.txt
cat "$ADGUARD_TEMP" > "$ADGUARD_OUTPUT"

echo "已生成 $ADGUARD_OUTPUT"

# 清理临时文件（本地运行时有用，GitHub Actions 会自动清理）
rm -f "$TEMP_FILE" "$ADGUARD_TEMP" 2>/dev/null || true
