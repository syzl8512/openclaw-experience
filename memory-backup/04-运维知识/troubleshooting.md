# 故障排查记录与修复经验 (Troubleshooting & Experience)

## 2026-02-28: TUI 404 错误与全局命令失效

### 问题现象

- TUI 发送消息返回 `HTTP 404: 404 page not found`。
- 终端执行 `openclaw` 提示 `command not found`。

### 根本原因 (Root Cause)

1. **API 类型配置错误**：在 `openclaw.json` 中，MiniMax 供应商被错误地设置为了 `api: openai-responses`。
   - _教训_：`openai-responses` 是针对 OpenAI Beta 版的 Realtime API。MiniMax 的兼容接口仅支持标准的 Chat Completions，必须使用 `openai-completions`。
2. **域名混淆**：旧的 `api.minimax.chat` 域名已不再适用于最新的 API 接口，应统一使用 `api.minimaxi.com`。
3. **环境变量未持久化**：`openclaw` 命令未加入 PATH，导致 SSH 登录后无法直接使用。

### 修复动作 (Actions)

1. **更正配置**：将 `api` 修改为 `openai-completions`，`baseUrl` 修改为 `https://api.minimaxi.com/v1`。
2. **建立全局访问**：在 `/Users/agent/.local/bin/openclaw` 创建了包装脚本，并在 `~/.zshrc` 中添加了别名。
3. **服务自愈**：运行 `self_heal.sh` 清理了由于配置错误导致的僵尸进程。

### 经验总结

- **验证第一**：修改 `openclaw.json` 后不能只看语法，必须执行 `openclaw agent` 测试连接。
- **别名依赖**：在 SSH 环境下，别名（Alias）比环境变量有时更可靠，但包装脚本是最佳实践。

---

## 2026-02-28 (追加): 插件配置校验错误 (Memory-LanceDB-Pro)

### 问题现象
- Gateway 启动失败，提示 `Invalid config at ~/.openclaw/openclaw.json`。
- 报错核心：`retrieval: must NOT have additional properties`。

### 根本原因
- **Schema 冲突**：在 `openclaw.json` 中，`retrieval` 对象包含了 `rerankEndpoint` 和 `rerankProvider` 字段，但插件的 `openclaw.plugin.json` 明确规定 `additionalProperties: false` 且不包含这两个字段。
  - *教训*：OpenClaw 插件配置是强校验的。如果插件文档或 Schema 没有定义的字段，绝对不能出现在 `config` 中，否则会导致服务无法启动（卡死）。

### 修复动作
- 手动删除 `openclaw.json` 中 `retrieval` 部分的冗余字段。
- 运行 `openclaw doctor` 验证配置通过。
- 运行 `openclaw gateway restart` 恢复服务。

---

## 同步时间

- 同步时间：2026-03-04 00:00 (Asia/Shanghai)
