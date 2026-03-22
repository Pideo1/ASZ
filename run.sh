#!/bin/bash

# 定义目标URL
API_URL="https://mtpro.xyz/api/?type=socksS"

# 定义输出文件名
OUTPUT_FILE="sock.txt"

# 使用 curl 获取数据，通过管道传给 jq 进行解析和格式化，
# 最后将结果重定向到输出文件。
# -s: 静默模式，不显示进度条
# -r: jq 的 raw-output 选项，输出不带引号的纯文本字符串
echo "正在从 $API_URL 获取代理列表..."
curl -s "$API_URL" --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0" -H 'Referer: https://mtpro.xyz/socks5' | jq -r '.[] | "sock5://\(.ip):\(.port)"' > "$OUTPUT_FILE"

echo "处理完成！代理列表已保存到 $OUTPUT_FILE 文件中。"
echo "文件内容预览:"
head -n 5 "$OUTPUT_FILE"
