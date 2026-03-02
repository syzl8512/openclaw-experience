#!/bin/bash

# 视频下载脚本
# 用法: ./download_video.sh [抖音链接|B站链接] [输出目录]

set -e

VIDEO_URL="$1"
OUTPUT_DIR="${2:-/tmp}"
VENV_PATH="/tmp/agent-reach-venv"

source "$VENV_PATH/bin/activate"

if echo "$VIDEO_URL" | grep -q "douyin.com"; then
    PLATFORM="douyin"
elif echo "$VIDEO_URL" | grep -q "bilibili.com"; then
    PLATFORM="bilibili"
else
    echo "不支持的视频平台"
    exit 1
fi

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/video_${TIMESTAMP}.mp4"

if [ "$PLATFORM" = "douyin" ]; then
    VIDEO_INFO=$(mcporter call "douyin.parse_douyin_video_info(share_link: \"$VIDEO_URL\")")
    DOWNLOAD_URL=$(echo "$VIDEO_INFO" | jq -r '.download_url')
    yt-dlp "$DOWNLOAD_URL" -o "$OUTPUT_FILE"
else
    yt-dlp --cookies-from-browser chrome "$VIDEO_URL" -o "$OUTPUT_FILE"
fi

echo "视频已保存到: $OUTPUT_FILE"
