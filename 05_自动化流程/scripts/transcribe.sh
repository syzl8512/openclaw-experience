#!/bin/bash

# 语音识别脚本
# 用法: ./transcribe.sh [视频路径] [输出路径]

set -e

VIDEO_PATH="$1"
OUTPUT_PATH="${2:-/tmp/transcript.txt}"
VENV_PATH="/tmp/agent-reach-venv"

source "$VENV_PATH/bin/activate"

python3 << SCRIPT
from faster_whisper import WhisperModel

print("加载 Whisper 模型...")
model = WhisperModel("base", device="cpu", compute_type="int8")

print("开始识别: $VIDEO_PATH")
segments, info = model.transcribe("$VIDEO_PATH", language="zh")

with open("$OUTPUT_PATH", "w", encoding="utf-8") as f:
    full_text = ""
    for segment in segments:
        text = segment.text.strip()
        if text:
            full_text += text + " "
    f.write(full_text)

print(f"识别完成，已保存到: $OUTPUT_PATH")
SCRIPT
