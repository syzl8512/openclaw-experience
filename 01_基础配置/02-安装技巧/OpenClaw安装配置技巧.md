# OpenClaw 安装与配置技巧

## 系统要求

- macOS (推荐 M1/M2/M3 Mac mini)
- Node.js v18+
- Python 3.9+

## 安装步骤

### 1. 安装 OpenClaw

```bash
# 方式一：npm 安装
npm install -g openclaw

# 方式二：直接下载
curl -L https://github.com/openclaw/openclaw/releases/latest/download/openclaw-darwin-arm64.tar.gz -o openclaw.tar.gz
tar -xzf openclaw.tar.gz
```

### 2. 初始化配置

```bash
openclaw init
```

### 3. 启动 Gateway

```bash
openclaw gateway start
```

## 常用命令

| 命令 | 说明 |
|------|------|
| `openclaw status` | 查看状态 |
| `openclaw gateway start` | 启动网关 |
| `openclaw gateway restart` | 重启网关 |
| `openclaw config edit` | 编辑配置 |

## 飞书配置

1. 创建飞书应用：https://open.feishu.cn/
2. 获取 App ID 和 App Secret
3. 配置机器人权限
4. 在 config.yaml 中添加飞书配置

## Ubuntu 节点配置

- SSH 连接到群晖虚拟机
- 安装 OpenClaw CN 版
- 配置端口映射（2221 -> 22）
- 添加到节点列表

## 技能安装

```bash
clawdhub install <skill-name>
```

## 定时任务

使用 `cron` 命令管理定时任务：
- 每小时健康检查
- 每日记忆维护
- 夜间书籍编写
