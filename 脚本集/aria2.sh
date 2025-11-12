#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

if [ ! -f "$INPUT_FILE" ]; then
    echo "错误: 输入文件 $INPUT_FILE 不存在"
    exit 1
fi

if [ ! -f "$OUTPUT_FILE" ]; then
    touch "$OUTPUT_FILE"
fi

# 处理输入文件并去重（使用 sort 和 comm 命令）
sed 's/^+\.//' "$INPUT_FILE" | sort -u > /tmp/new_sorted.txt
sort -u "$OUTPUT_FILE" > /tmp/old_sorted.txt

# 找出新内容（在new中但不在old中）
comm -23 /tmp/new_sorted.txt /tmp/old_sorted.txt > /tmp/diff.txt

# 统计新增数量
added_count=$(wc -l < /tmp/diff.txt)

# 追加新内容
cat /tmp/diff.txt >> "$OUTPUT_FILE"

# 清理临时文件
rm /tmp/new_sorted.txt /tmp/old_sorted.txt /tmp/diff.txt

echo "处理完成: 新增 $added_count 条记录到 $OUTPUT_FILE"
