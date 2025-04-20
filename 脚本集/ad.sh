#!/bin/bash

# 定义一个函数，用于下载和处理文件
download_and_process() {
    # 接收三个参数，分别是下载的URL，保存的文件路径，和处理的命令
    URL=$1
    OUTPUT_FILE=$2
    PROCESS_CMD=$3

    # 下载文件并保存到临时文件
    TMP_FILE="/tmp/$(basename $OUTPUT_FILE)_temp.txt"
    wget -O "$TMP_FILE" "$URL"

    # 检查文件是否下载成功
    if [ $? -eq 0 ]; then
        # 根据处理命令，提取并重新生成列表，保存到目标文件
        cat "$TMP_FILE" | eval "$PROCESS_CMD" > "$OUTPUT_FILE"
        echo "Updated $(basename $OUTPUT_FILE) successfully."
    else
        echo "Failed to download the file from $URL."
    fi

    # 删除临时文件
    rm -f "$TMP_FILE"
}

# 下载和处理AdGuard规则文件，生成gfw.txt文件
download_and_process "https://bitcion.github.io/zaixiantuoguan/AdGuard%E8%A7%84%E5%88%99.txt" "/opt/ipv4.txt" "grep -oE '([a-zA-Z0-9.-]+)\^' | sed 's/\^//'"

# 下载和处理cn.txt文件，不需要额外处理
download_and_process "https://bitcion.github.io/zaixiantuoguan/cn.txt" "/opt/cn.txt" "cat"

# 下载和处理DLC.txt文件，不需要额外处理
download_and_process "https://bitcion.github.io/zaixiantuoguan/ipv4.txt" "/opt/quic.txt" "cat"

# 下载和处理anti-ad-for-smartdns.conf文件，替换/#为/#4
download_and_process "https://anti-ad.net/anti-ad-for-smartdns.conf" "/opt/anti-ad-for-smartdns.conf" "sed 's/#/#4/g'"
