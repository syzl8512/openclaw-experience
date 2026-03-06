# OpenClaw 经验分享仓库

> 本仓库用于存放 OpenClaw 的所有经验、技巧和技能，供多个 Agent 学习同步。

---

## 📁 目录结构

| 编号 | 目录 | 说明 |
|------|------|------|
| 一 | [01_基础配置](./01_基础配置/) | 记忆模式、安装技巧、数据库要求 |
| 二 | [02_运维保障](./02_运维保障/) | 运维知识、故障处理、系统监控 |
| 三 | [03_核心Skill](./03_核心Skill/) | 100+ Skills 技能包 |
| 四 | [04_MCP工具](./04_MCP工具/) | MCP 服务器配置和集成（待建设） |
| 五 | [05_自动化流程](./05_自动化流程/) | 项目文档、脚本、自动化工作流 |
| 六 | [06_飞书集成](./06_飞书集成/) | 飞书文档、网盘、知识库集成 |
| 七 | [07_创作工具](./07_创作工具/) | 书籍创作、PPT、Excel 等创作技能 |
| 八 | [08_学习资源](./08_学习资源/) | 教程、参考资料（待建设） |

---

## 📋 核心文件

| 文件 | 用途 |
|------|------|
| `todo.md` | 多 Agent 任务同步列表 |
| `memory/` | 当前运行记忆 |
| `backup.log` | 备份日志 |

---

## Claude Code 自定义命令

本仓库包含 Claude Code 中使用的自定义命令，用于提升工作效率和自动化工作流程。

### claude-commands 目录

| 命令文件 | 功能描述 |
|---------|---------|
| `claude-commands/ppt制作.md` | 智能PPT生成助手，支持逐字稿生成和PPT调整 |

### skills 目录

| Skill文件 | 功能描述 |
|-----------|---------|
| `skills/ppt-generator/SKILL.md` | PPT生成规范（乔布斯风格标题、颜色系、字体规范） |

### 安装方式

1. 克隆仓库到本地
```bash
git clone https://github.com/syzl8512/openclaw-experience.git
```

2. 将命令文件复制到 Claude Code 的 commands 目录
```bash
# macOS
cp claude-commands/ppt制作.md ~/.claude/commands/
cp -r skills/ ~/.claude/skills/
```

---

## 🔧 主要 Skill 分类

### 文档处理
- `markdown-converter` - 文档格式转换
- `mineru` / `mineru-cloud` - PDF 解析
- `pptx-2` - PPT 制作
- `excel-xlsx` - Excel 处理
- `word-docx` - Word 处理

### 飞书集成
- `feishu-doc` - 飞书文档
- `feishu-drive` - 飞书网盘
- `feishu-wiki` - 飞书知识库

### AI 能力
- `tavily-search` - 网络搜索
- `supabase` - 数据库
- `self-evolve` - 自进化
- `book-adventure-writer` - 儿童书籍创作

### 运维
- `openclaw-ops` - 运维知识
- `reback` - 回滚保护

---

## 📝 更新日志

- **2026-03-06**: 全新八大分类结构上线
- 持续更新中...

---

*本仓库供 OpenClaw Agent 学习使用*

---

## English Version

See [README_EN.md](./README_EN.md) for English documentation.
