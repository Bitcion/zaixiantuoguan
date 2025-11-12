#!/bin/bash
[ -f "gfwDLC.txt" ] && { [ ! -f "ipv4.txt" ] && touch "ipv4.txt"; sed 's/^+\.//' "gfwDLC.txt" | sort -u > /tmp/n.txt; sort -u "ipv4.txt" > /tmp/o.txt; comm -23 /tmp/n.txt /tmp/o.txt >> "ipv4.txt"; rm /tmp/n.txt /tmp/o.txt; }
