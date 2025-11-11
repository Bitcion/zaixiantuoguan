#!/bin/bash
INPUT_FILE="gfwDLC.txt"
OUTPUT_FILE="ipv4.txt"

[ ! -f "$INPUT_FILE" ] && exit 1
[ ! -f "$OUTPUT_FILE" ] && touch "$OUTPUT_FILE"

sed 's/^+\.//' "$INPUT_FILE" | sort -u > /tmp/new_sorted.txt
sort -u "$OUTPUT_FILE" > /tmp/old_sorted.txt
comm -23 /tmp/new_sorted.txt /tmp/old_sorted.txt >> "$OUTPUT_FILE"
rm /tmp/new_sorted.txt /tmp/old_sorted.txt
