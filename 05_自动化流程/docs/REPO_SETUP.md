# OpenClaw GitHub 仓库使用指南

> 给 AI 助手的完整指令手册 | 更新日期：2026-03-02

---

## 📁 仓库一览

| 仓库 | 用途 | 地址 |
|------|------|------|
| **openclaw-experience** | 经验分享（多 AI 交互） | github.com/syzl8512/openclaw-experience |
| **todo-daily** | 待办/日报同步 | github.com/syzl8512/todo-daily |
| **openclaw-mini** | Mac mini 全量备份 | github.com/syzl8512/openclaw-mini |
| **openclaw-xiaoai** | 小爱助手全量备份 | github.com/syzl8512/openclaw-xiaoai |
| **awesome-openclaw-skills** | 常用技能（同步上游） | github.com/syzl8512/awesome-openclaw-skills |
| **openclaw-workspace** | Workspace 模板 | github.com/syzl8512/openclaw-workspace |

---

## 🔑 核心指令（必须遵守）

### 当用户说「分享」或「经验分享」时
→ 总结并推送到 **openclaw-experience** 仓库

### 当用户说「请更新」或「迭代」时
→ 拉取 **openclaw-experience** 仓库最新内容

### 当用户说「同步todo」时
→ 同步待办/日报到 **todo-daily** 仓库

---

## 📥 Pull（拉取）命令

```bash
# 经验分享仓库
git pull https://github.com/syzl8512/openclaw-experience.git main

# 待办/日报仓库
git pull https://github.com/syzl8512/todo-daily.git main

# 同步上游技能库
git pull https://github.com/syzl8512/awesome-openclaw-skills.git main
```

---

## 📤 Push（推送）命令

```bash
# 推送到经验分享仓库
git add .
git commit -m "经验分享: xxx"
git push https://github.com/syzl8512/openclaw-experience.git main

# 推送到待办/日报仓库
git add .
git commit -m "更新待办: xxx"
git push https://github.com/syzl8512/todo-daily.git main

# 推送到全量备份仓库
git push https://github.com/syzl8512/openclaw-mini.git main
git push https://github.com/syzl8512/openclaw-xiaoai.git main
```

---

## 🗂️ 经验库目录结构 (openclaw-experience)

```
openclaw-experience/
├── SKILL.md                    # 经验分享 Skill
├── README.md
├── brainstorm/                 # 头脑风暴
├── doc-writer/                # 文档写作
├── file-sender/               # 文件发送到飞书
├── mineru-cloud/              # PDF 解析云端
├── mineru/                    # PDF 解析本地
├── reback/                    # 回滚保护
├── skill-tools/               # 技能工具
├── workflow-runner/           # 工作流
├── writing-plans/             # 写作计划
└── ops/                       # 运维经验
    ├── rules/
    │   └── iron_laws.md       # 运维铁律
    └── experience/
        └── troubleshooting.md  # 故障排查记录
```

---

## 🛡️ 运维铁律（必须遵守）

### 1. 模型提供商配置准则
- **MiniMax 专用**：
  - `baseUrl` 必须使用 `https://api.minimaxi.com/v1`（不要使用 .chat 域名）
  - `api` 类型必须设置为 `openai-completions` 或保持为空
  - **绝对禁止**：在 MiniMax 配置中使用 `openai-responses`
- **配置变更验证**：任何对 `openclaw.json` 的修改，必须立即运行 `openclaw agent --message "ping" --agent main` 进行端到端验证

### 2. 系统环境与路径
- **全局命令**：始终使用 `openclaw` 命令而非 `node scripts/...`
- **工作目录**：如果全局命令失效，确保先 `cd /Users/agent/Documents/openclaw`

### 3. 故障自愈流程
- 如果 TUI 无响应或返回 404/500：
  1. 检查 `openclaw.json` 中的 `api` 类型是否匹配供应商
  2. 运行 `bash /Users/agent/maintenance/self_heal.sh`
  3. 查看 `~/.openclaw/logs/gateway.log` 获取实时报错详情

### 4. 知识同步
- 每次修复重大故障后，必须更新 `ops/experience/troubleshooting.md`
- 每次启动时，必须先拉取 `ops/rules/iron_laws.md` 中的最新规则

---

## 📝 待办/日报格式 (todo-daily)

### 待办清单格式
```markdown
# 待办清单 (YYYY-MM-DD)

## 任务列表
- [ ] 1. 任务名称
- [ ] 2. 任务名称

---

*创建于 YYYY-MM-DD*
```

### 日报格式
```markdown
# 日报 (YYYY-MM-DD)

## 完成事项
- [x] 完成的任务 1
- [x] 完成的任务 2

## 遇到的问题
- 问题描述

## 待处理
- 任务名称

---

*日期: YYYY-MM-DD*
```

---

## 🔄 技能库同步 (awesome-openclaw-skills)

```bash
# 同步上游更新
git fetch upstream
git merge upstream/main
git push origin main
```

---

## ⚠️ 注意事项

1. **Token 认证**：使用 GitHub Personal Access Token (ghp_xxx) 进行认证
2. **私有仓库**：部分仓库是私有的，需要正确的 Token 权限
3. **经验优先**：遇到问题时，先检查 `ops/rules/iron_laws.md` 和 `ops/experience/troubleshooting.md`
4. **每日同步**：建议每天启动时拉取一次经验库更新

---

## 📞 主机对应仓库

| 主机 | 主力仓库 | 备份仓库 |
|------|----------|----------|
| mia (MacBook Pro) | openclaw-experience, todo-daily | mia (私有) |
| mini (Mac mini) | openclaw-experience, todo-daily | openclaw-mini |
| xiaoai (小爱) | openclaw-experience, todo-daily | openclaw-xiaoai |

---

> 遵循以上指令，确保多 AI 之间的经验同步和协作。
