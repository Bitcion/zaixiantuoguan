bash#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

[ ! -f "$INPUT_FILE" ] && exit 1

TEMP_FILE=$(mktemp)
sed 's/^+\.//' "$INPUT_FILE" > "$TEMP_FILE"

if [ ! -f "$OUTPUT_FILE" ]; then
    echo "#屏蔽ipv6,在gfwDLC.txt中添加" > "$OUTPUT_FILE"
    cat "$TEMP_FILE" >> "$OUTPUT_FILE"
    echo "#自定义gfw" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    rm "$TEMP_FILE"
    exit 0
fi

line_num=$(grep -n "^#自定义gfw,直接在下面添加" "$OUTPUT_FILE" | cut -d: -f1)

if [ -n "$line_num" ]; then
    head -n $((line_num - 1)) "$OUTPUT_FILE" > /tmp/before.txt
    tail -n +$((line_num + 1)) "$OUTPUT_FILE" > /tmp/after.txt
    
    while IFS= read -r line || [ -n "$line" ]; do
        [[ "$line" == \#* ]] && continue
        [ -z "$line" ] && continue
        if ! grep -Fxq "$line" "$TEMP_FILE"; then
            sed -i "/^$(echo "$line" | sed 's/[.]/\\./g')$/d" /tmp/before.txt
            grep -Fxq "$line" /tmp/after.txt || echo "$line" >> /tmp/after.txt
        fi
    done < /tmp/before.txt
    
    echo "#屏蔽ipv6,在gfwDLC.txt中添加" > "$OUTPUT_FILE"
    cat "$TEMP_FILE" >> "$OUTPUT_FILE"
    echo "#自定义gfw,直接在下面添加" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    sed '/^$/d' /tmp/after.txt >> "$OUTPUT_FILE"
    rm /tmp/before.txt /tmp/after.txt
else
    echo "#屏蔽ipv6,在gfwDLC.txt中添加" > "$OUTPUT_FILE"
    cat "$TEMP_FILE" >> "$OUTPUT_FILE"
    echo "#自定义gfw,直接在下面添加" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
fi

rm "$TEMP_FILE"
