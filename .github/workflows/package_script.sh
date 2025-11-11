#!/bin/bash
# 定义输入和输出文件
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

# 检查输入文件是否存在
if [ ! -f "$INPUT_FILE" ]; then
    echo "错误: 输入文件 $INPUT_FILE 不存在"
    exit 1
fi

# 使用 sed 命令一次性处理（更高效）
sed 's/^+\.//' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "处理完成: $OUTPUT_FILE"
