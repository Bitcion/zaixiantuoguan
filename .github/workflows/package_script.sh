#!/bin/bash

# 定义输入和输出文件
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

# 如果输出文件已存在，先删除它
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# 处理文件内容，移除每行开头的"+."并写入输出文件
while IFS= read -r line || [ -n "$line" ]; do
    # 如果行以"+."开头，则移除这个前缀
    if [[ $line == +.* ]]; then
        echo "${line:2}" >> "$OUTPUT_FILE"
    else
        # 不以"+."开头的行直接写入
        echo "$line" >> "$OUTPUT_FILE"
    fi
done < "$INPUT_FILE"
