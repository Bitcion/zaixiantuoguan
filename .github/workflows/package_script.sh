#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

[ ! -f "$INPUT_FILE" ] && exit 1

if [ ! -f "$OUTPUT_FILE" ]; then
    echo "#屏蔽ipv6" > "$OUTPUT_FILE"
fi

TEMP_FILE=$(mktemp)
sed 's/^+\.//' "$INPUT_FILE" > "$TEMP_FILE"

line_num=$(grep -n "^#自定义gfw" "$OUTPUT_FILE" | cut -d: -f1)

if [ -n "$line_num" ]; then
    head -n $((line_num - 1)) "$OUTPUT_FILE" > /tmp/before.txt
    tail -n +$line_num "$OUTPUT_FILE" > /tmp/after.txt
    
    while IFS= read -r line || [ -n "$line" ]; do
        [ -z "$line" ] && continue
        grep -Fxq "$line" /tmp/before.txt || grep -Fxq "$line" /tmp/after.txt || echo "$line" >> /tmp/before.txt
    done < "$TEMP_FILE"
    
    cat /tmp/before.txt > "$OUTPUT_FILE"
    cat /tmp/after.txt >> "$OUTPUT_FILE"
    rm /tmp/before.txt /tmp/after.txt
else
    while IFS= read -r line || [ -n "$line" ]; do
        [ -z "$line" ] && continue
        grep -Fxq "$line" "$OUTPUT_FILE" || echo "$line" >> "$OUTPUT_FILE"
    done < "$TEMP_FILE"
fi

rm "$TEMP_FILE"
