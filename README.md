# Claude Code 自定义命令集合

## Claude Code Custom Commands Collection

本仓库收录了在 Claude Code 中使用的自定义命令，用于提升工作效率和自动化工作流程。

This repository contains custom commands for Claude Code, designed to improve work efficiency and automate workflows.

---

## 目录 | Directory

### claude-commands 自定义命令

| 命令文件 | 功能描述 | Function |
|---------|---------|----------|
| ppt制作.md | 智能PPT生成助手，支持逐字稿生成和PPT调整 | AI PPT Generator |

---

## 使用说明 | Usage

### 安装方式

1. 克隆仓库到本地
```bash
git clone https://github.com/syzl8512/openclaw-experience.git
```

2. 将命令文件复制到 Claude Code 的 commands 目录
```bash
# macOS
cp claude-commands/ppt制作.md ~/.claude/commands/
```

---

## ppt制作 命令详解

### 功能概述

智能PPT生成助手，基于逐字稿或参考PPT自动生成乔布斯风格的高质量演示文稿。

AI PPT Generator - Automatically generates high-quality乔布斯-style presentations from manuscripts or reference PPTs.

### 使用方式

#### 方式一：基于逐字稿生成

```
/ppt制作
[附上逐字稿内容]
[汇报对象：xxx]
```

#### 方式二：基于参考PPT调整

```
/ppt制作
请调整这个PPT
[汇报对象：xxx]
[附上PPT文件]
```

### 技术规范

- 格式：单个HTML文件
- 技术栈：Vue 3 + TailwindCSS
- 比例：9:16 竖屏
- 效果：深色渐变底色 + 模糊浮动光斑 + 动画

---

## 贡献指南 | Contributing

欢迎提交 Issue 和 Pull Request！

Issues and Pull Requests are welcome!

---

## 许可证 | License

MIT License

---

## 联系方式 | Contact

GitHub: https://github.com/syzl8512/openclaw-experience
