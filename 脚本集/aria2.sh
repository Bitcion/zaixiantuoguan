#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

[ ! -f "$INPUT_FILE" ] && exit 1
[ ! -f "$OUTPUT_FILE" ] && touch "$OUTPUT_FILE"

TEMP_FILE=$(mktemp)

# 处理 gfwDLC.txt，移除 +. 前缀
while IFS= read -r line || [ -n "$line" ]; do
    [[ $line == +.* ]] && echo "${line:2}" >> "$TEMP_FILE" || echo "$line" >> "$TEMP_FILE"
done < "$INPUT_FILE"

# 只添加不存在的行（保持 ipv4.txt 原有顺序）
while IFS= read -r line || [ -n "$line" ]; do
    grep -Fxq "$line" "$OUTPUT_FILE" || echo "$line" >> "$OUTPUT_FILE"
done < "$TEMP_FILE"

rm "$TEMP_FILE"
