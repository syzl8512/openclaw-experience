# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Web Station部署

- **Web Station目录**: /volume1/@appconf/WebStation/personal_web/
- **SSH**: synology-wan (ximi.space:2211, 用户syzl8512)
- **密钥**: ~/.ssh/id_rsa_maintenance

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- **群晖 (DS1821plus)**
  - 别名：`synology-wan`（定义在 ~/.ssh/config）
  - 地址：`ximi.space`
  - 端口：2211
  - 用户：syzl8512
  - 密钥：`~/.ssh/id_rsa_maintenance`
  - 用途：监控与远程维护、Web部署
  - **重要**：先检查 ~/.ssh/config 获取正确配置

- **软路由 (iStore)**
  - 地址：`ximi.space`
  - 端口：9998
  - 用户：root
  - 密码：Sy135790@
  - 用途：Passwall、OpenClash、Docker 管理

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

## 🤖 AI实用工具清单

> 来源：赛博自由老爹《10个顶尖大学生都在用的AI工具》

### 🔑 入口与搜索
| 工具 | 网址 | 用途 |
|------|------|------|
| LMArena | lmarena.ai | 免费用全球顶尖大模型（GPT-5/Claude 4），模型PK |
| Perplexity | perplexity.ai | AI搜索引擎，直接给答案+信源 |

### 📚 阅读与学习
| 工具 | 网址 | 用途 |
|------|------|------|
| ChatPDF | chatdoc.com | PDF对话、总结、划重点、出考试题 |
| 沉浸式翻译 | 浏览器插件 | 双语对照阅读 |
| DeepResearch | GPT/Gemini内置 | 深度研究，自动生成报告 |

### ✍️ 写作与演示
| 工具 | 网址 | 用途 |
|------|------|------|
| QuillBot | quillbot.com | 智能改写、语法检查、降重 |
| Gamma | gamma.app | 30秒AI生成PPT |
| Flourish | flourish.studio | 顶级数据可视化 |

### 💻 编程与效率
| 工具 | 网址 | 用途 |
|------|------|------|
| Cursor | cursor.com | AI编程，用自然语言生成代码 |
| TinyWow | tinywow.com | 270+种格式转换工具 |

---

Add whatever helps you do your job. This is your cheat sheet.
