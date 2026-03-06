# Agent-Reach 安装配置经验

> 更新时间：2026-03-02

## 是什么

Agent-Reach 是一个给 AI Agent 装上互联网能力的工具集。

- 读网页、YouTube、B站
- 搜 Twitter、Reddit、GitHub
- 解析 RSS 订阅
- 全网语义搜索

## 安装步骤

### 1. 安装 Python 环境

由于 macOS 系统保护，需要用 `--break-system-packages`：

```bash
python3 -m pip install --user --break-system-packages https://github.com/Panniantong/agent-reach/archive/main.zip
```

### 2. 配置 PATH

把 Python bin 目录加入 PATH（加到 ~/.zshrc）：

```bash
export PATH="$PATH:/Users/mia/Library/Python/3.14/bin"
```

### 3. 安装系统依赖

```bash
# 安装 npm 工具
npm install -g mcporter xreach-cli
```

### 4. 配置 Exa 搜索

```bash
mcporter config add exa https://mcp.exa.ai/mcp
```

### 5. 验证状态

```bash
agent-reach doctor
```

## 当前可用渠道

| 渠道 | 状态 |
|------|------|
| YouTube 视频/字幕 | ✅ |
| B站 视频/字幕 | ✅ |
| RSS 订阅源 | ✅ |
| 全网搜索 (Exa) | ✅ |
| 任意网页 (Jina) | ✅ |
| Twitter/X | ✅ |

## 待配置

- GitHub CLI (`brew install gh`)
- 小红书（需要 Docker + MCP）
- 抖音（需要 MCP）
- Reddit（需要代理）

## 常用命令

```bash
# 读网页
curl https://r.jina.ai/URL

# 提取 YouTube 字幕
yt-dlp --dump-json URL

# 搜 GitHub
gh search repos "关键词"
```

## 参考

- 官网：https://github.com/Panniantong/Agent-Reach
- 安装文档：https://raw.githubusercontent.com/Panniantong/agent-reach/main/docs/install.md
