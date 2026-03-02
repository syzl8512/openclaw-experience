# ClaudeCode Skill: 视频学习笔记助手

## Skill 定义

```yaml
name: video-learning-assistant
description: 一键分析抖音/B站视频，自动提取口播内容、生成学习笔记，保存视频文件
version: 1.0.0
author: syzl8512
```

## 触发指令

```
帮我分析这个视频 + [视频链接]
```

## 工作流

### 第一步：视频解析

1. 抖音视频：使用 mcporter 调用 douyin.parse_douyin_video_info
2. B站视频：使用 yt-dlp --dump-json 获取视频元信息

### 第二步：视频下载

```bash
# 抖音
mcporter call 'douyin.parse_douyin_video_info(share_link: "链接")'
yt-dlp "下载链接" -o /tmp/video.mp4

# B站
yt-dlp --cookies-from-browser chrome "视频URL" -o /tmp/video.mp4
```

### 第三步：语音识别

使用 faster-whisper 进行语音转文字：

```bash
uv pip install faster-whisper

python -c "
from faster_whisper import WhisperModel
model = WhisperModel('base', device='cpu', compute_type='int8')
segments, info = model.transcribe('视频路径', language='zh')
for segment in segments:
    print(segment.text)
"
```

### 第四步：生成笔记

1. 整理口播内容
2. 提取关键要点
3. 生成结构化笔记

### 第五步：视觉分析（可选）

提取关键帧并进行图片分析
