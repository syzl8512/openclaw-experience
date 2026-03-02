# OpenClaw 实战经验库

> 记录我们使用 OpenClaw/ClaudeCode 进行 AI 自动化工作的实战经验

---

## 视频学习笔记助手

一键分析抖音/B站视频，自动提取口播内容、生成学习笔记，保存视频文件。

### 功能特性

| 功能 | 说明 |
|------|------|
| 视频解析 | 自动获取抖音/B站视频信息 |
| 语音识别 | 使用 Whisper 提取口播内容 |
| 笔记生成 | 结构化整理学习要点 |
| 视觉分析 | 可选：提取关键帧并进行图片分析 |
| 讲解稿生成 | 可选：生成完整讲解稿 |

### 使用方法

#### 1. 基础使用

```
帮我分析这个视频 + [视频链接]
```

#### 2. 完整分析（含视觉分析）

```
帮我分析这个视频 + [视频链接]，做图片抽样和视觉分析
```

#### 3. 生成讲解稿

```
帮我分析这个视频 + [视频链接]，生成讲解稿
```

---

## 环境配置

### Python 环境

```bash
# 创建虚拟环境
uv venv /tmp/agent-reach-venv --python 3.11

# 激活环境
source /tmp/agent-reach-venv/bin/activate
```

### 必需工具安装

```bash
# 1. 安装 agent-reach
uv pip install https://github.com/Panniantong/agent-reach/archive/main.zip

# 2. 安装视频处理工具
uv pip install yt-dlp faster-whisper browser-cookie3

# 3. 安装 MCP 工具
npm install -g mcporter

# 4. 安装 ffmpeg（macOS）
brew install ffmpeg
```

### 环境变量配置

在项目 `.env` 文件中添加：

```bash
# 阿里云百炼（抖音MCP需要）
DASHSCOPE_API_KEY=sk-你的APIKey
```

---

## 工具安装详解

### 1. Agent Reach 安装

```bash
uv pip install https://github.com/Panniantong/agent-reach/archive/main.zip
agent-reach install --env=auto
agent-reach doctor
```

### 2. 抖音 MCP 配置

1. 获取 DashScope API Key：https://bailian.console.aliyun.com/
2. 启动 Douyin MCP

```bash
uv pip install douyin-mcp-server
export DASHSCOPE_API_KEY="sk-xxx"
python -c "
from douyin_mcp_server.server import mcp
mcp.settings.host = '127.0.0.1'
mcp.settings.port = 18070
mcp.run(transport='streamable-http')
"
mcporter config add douyin http://localhost:18070/mcp
```

### 3. B站视频下载

```bash
# 自动从浏览器提取Cookie
agent-reach configure --from-browser chrome

# 下载视频
yt-dlp --cookies-from-browser chrome "视频URL" -o /tmp/video.mp4
```

### 4. 语音识别

```bash
uv pip install faster-whisper

python -c "
from faster_whisper import WhisperModel
model = WhisperModel('base', device='cpu', compute_type='int8')
segments, info = model.transcribe('video.mp4', language='zh')
for segment in segments:
    print(segment.text)
"
```

### 5. 视频关键帧提取

```bash
ffmpeg -i video.mp4 -vf "fps=1/30" frames/frame_%04d.jpg
```

### 6. 图片分析

使用 MiniMax 视觉理解进行图片分析

---

## 常见问题

### Q1: 抖音视频下载失败

**解决**：确保已设置 DASHSCOPE_API_KEY

### Q2: B站字幕无法下载

**解决**：使用 --cookies-from-browser chrome 登录

### Q3: Whisper 识别结果不准确

**解决**：使用更大的模型（small/medium）

---

## 更新日志

### 2026-03-02
- 初始版本
- 完成视频分析工作流
- 完成语音识别集成
- 完成笔记生成功能
