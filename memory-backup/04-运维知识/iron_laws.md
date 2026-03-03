# OpenClaw 运维铁律 (Iron Laws)

为了避免类似 404 错误和配置失效的问题再次发生，所有助手（Antigravity, 小爱, Mini）必须严格遵守以下准则：

## 1. 模型提供商配置准则

- **MiniMax 专用**：
  - `baseUrl` 必须使用 `https://api.minimaxi.com/v1`（不要使用 .chat 域名）。
  - `api` 类型必须显式设置为 `openai-completions` 或保持为空（默认）。
  - **绝对禁止**：在 MiniMax 配置中使用 `openai-responses`。
- **配置变更验证**：
  - 任何对 `openclaw.json` 的修改，必须立即运行 `openclaw agent --message "ping" --agent main` 进行端到端验证。

## 2. 系统环境与路径

- **全局命令**：始终使用 `openclaw` 命令而非 `node scripts/...`。
- **工作目录**：如果全局命令失效，确保先 `cd /Users/agent/Documents/openclaw`。

## 3. 故障自愈流程

- 如果 TUI 无响应或返回 404/500：
  1. 检查 `openclaw.json` 中的 `api` 类型是否匹配供应商。
  2. 运行 `bash /Users/agent/maintenance/self_heal.sh`。
  3. 查看 `~/.openclaw/logs/gateway.log` 获取实时报错详情。

## 4. 知识同步

- 每次修复重大故障后，必须更新 `docs/ops/experience/troubleshooting.md`。
- 其他助手启动时，必须先拉取本目录下的最新规则。
