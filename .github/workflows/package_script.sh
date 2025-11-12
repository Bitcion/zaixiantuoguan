#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

[ ! -f "$INPUT_FILE" ] && exit 1
[ ! -f "$OUTPUT_FILE" ] && echo "#屏蔽ipv6" > "$OUTPUT_FILE"

TEMP_FILE=$(mktemp)
sed 's/^+\.//' "$INPUT_FILE" > "$TEMP_FILE"

line_num=$(grep -n "^#自定义gfw" "$OUTPUT_FILE" | cut -d: -f1)

if [ -n "$line_num" ]; then
    head -n $((line_num - 1)) "$OUTPUT_FILE" > /tmp/before.txt
    tail -n +$line_num "$OUTPUT_FILE" > /tmp/after.txt
    while IFS= read -r line || [ -n "$line" ]; do
        [[ "$line" == \#* ]] && continue
        [ -z "$line" ] && continue
        if ! grep -Fxq "$line" "$TEMP_FILE"; then
            sed -i "/^$(echo "$line" | sed 's/[.]/\\./g')$/d" /tmp/before.txt
            grep -Fxq "$line" /tmp/after.txt || echo "$line" >> /tmp/after.txt
        fi
    done < /tmp/before.txt
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
    grep -q "^#自定义gfw" "$OUTPUT_FILE" || echo "#自定义gfw" >> "$OUTPUT_FILE"
fi

rm "$TEMP_FILE"
