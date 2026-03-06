---
name: ppt-generator
description: "从讲稿自动生成高质量PPT的工作流。当用户让你生成PPT、制作演示文稿时使用此技能。"
---

# PPT Generator - 从讲稿到PPT的完整工作流

## 概述

将用户提供的讲稿文字自动转化为具有"乔布斯风格"的高质量PPT演示文稿。

**触发条件：** 用户让你生成PPT、制作演示文稿、从讲稿生成PPT

## 核心原则

### 核心理念
- **极简、有力、科技感**
- **一屏只讲一件事**
- 追求简洁有力的表达

### 视觉风格
- 深黑色背景、白灰配色文字
- 大量留白、居中对齐
- 竖屏 9:16（短视频平台优化）

## 字体规范

- **中文**：HarmonyOS Sans SC（鸿蒙字体）或思源黑体
- **英文**：Inter 或 Roboto
- **权重**：标题用 font-black，正文用 font-light

## 乔布斯式标题生成规则

### 核心原则
1. **一句话原则** - 每个标题必须能一口气说完
2. **对比鲜明** - 使用"不是...而是..."结构
3. **比喻驱动** - 用具体事物解释抽象概念
4. **痛点直击** - 问题式标题引发共鸣

### 标题类型模板
| 类型 | 公式 | 示例 |
|------|------|------|
| 对比式 | A是X，Y是B | MCP是工具箱，SKILL是说明书 |
| 比喻式 | X就像Y | AI用工具，像在开盲盒 |
| 问题式 | 为什么.../到底... | 普通人也能用AI超神？ |
| 断言式 | 直接给出结论 | 把重复劳动交给AI |
| 递进式 | 从X到Y | 从熬夜改PPT到一键生成 |

### 生成步骤
1. 提取核心概念
2. 寻找比喻对象
3. 压缩到12字以内
4. 检查是否引发好奇

## 颜色语义

| 颜色 | 含义 | 示例 |
|------|------|------|
| 青/蓝/紫 | 工具/Tool | 给AI一盒工具 |
| 黄/橙/绿 | 流程/Process | 让AI听话的说明书 |
| 红/粉 | 痛点/Problem | 像在开盲盒、不可控 |
| 渐变色 | 关键结论 | 核心金句 |
| 灰/白 | 中性说明 | 背景铺垫 |

## 讲稿修正规则

### 开场5秒原则
- 前3秒必须有"钩子"抓住观众
- 避免冗长铺垫

### 语言风格修正
- **口语化**：用"你"、"咱们"代替"用户"
- **加入节奏**：添加 `[停顿]`、`(放慢)` 标记
- **互动问句**：加入"你也..."、"对吧"

### 场景化表达
- **公式1**：时间场景 - "指针滑过凌晨两点...咖啡凉在一边"
- **公式2**：动作场景 - "去阳台伸伸懒腰...文稿就做好了"
- **公式3**：对比场景 - "你花了一整天精修...台下观众一直在刷手机"

### 冲突式表达
- 预期 vs 现实
- 努力 vs 无效
- 自我感动 vs 真实价值

## 工作流程

### Step 1: 读取用户原稿
- 分析章节结构、核心观点
- 识别逻辑关系（对比、因果、递进）

### Step 2: 生成乔布斯式标题
- 根据内容性质选择标题类型
- 压缩到12字以内

### Step 3: 生成修正版讲稿
- 口语化表达
- 加入场景化描述
- 添加互动元素

### Step 4: 生成PPT脚手架
```bash
cd /path/to/ppt-generator
./scripts/init-ppt.sh --slogan "标语" --title "标题" --series "系列名" --output "输出路径"
```

### Step 5: 修改PPT内容
- 使用 Vue 3 语法
- 在 slides 数组中添加对象
- 指定 type 和 html 内容

## 输出要求

- **格式**：单个HTML文件
- **技术栈**：Vue 3 + TailwindCSS
- **比例**：9:16 竖屏
- **效果**：深色渐变底色 + 模糊浮动光斑 + 缓慢动画
- **页数**：最少30页，内容充实

### 字体规范（大屏演示版）

- **标题**：6xl-9xl（text-6xl 到 text-9xl）
- **正文**：3xl-4xl（text-3xl 到 text-4xl）
- **重点数字**：9xl（text-9xl）
- **副标题/标签**：4xl（text-4xl）

### 底色规范

统一使用渐变系列，每页根据内容选择不同颜色：
- 紫色系：via-purple-900（重点讲解）
- 蓝色系：via-blue-900（时间线/故事）
- 青色系：via-cyan-900（MCP/技术）
- 黄色系：via-yellow-900（案例/数据）
- 红色系：via-red-900（痛点/警示）
- 绿色系：via-green-900（转折/成长）
- 橙色系：via-orange-900（核心理念）
- 靛蓝系：via-indigo-900（Skill体系）

### 页面结构规范

```html
<div class="slide active bg-gradient-to-br from-slate-900 via-[颜色]-900 to-slate-900">
  <div class="max-w-4xl px-8">
    [大字体内容]
  </div>
</div>
```

### 交互代码模板（点击切换 + 键盘控制）

```html
<style>
  .slide { min-height: 100vh; display: none; align-items: center; justify-content: center; cursor: pointer; position: relative; }
  .slide.active { display: flex; }
  .slide::after { content: '点击屏幕切换下一页 →'; position: absolute; bottom: 30px; left: 50%; transform: translateX(-50%); color: rgba(255,255,255,0.3); font-size: 14px; }
</style>

<body class="bg-black text-white">
  <script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    
    document.addEventListener('click', function() {
      slides[currentSlide].classList.remove('active');
      currentSlide = (currentSlide + 1) % slides.length;
      slides[currentSlide].classList.add('active');
    });
    
    document.addEventListener('keydown', function(e) {
      if (e.key === 'ArrowRight' || e.key === ' ') {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add('active');
      } else if (e.key === 'ArrowLeft') {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
      }
    });
  </script>
</body>
```

### 目录结构建议

40页PPT的典型结构：
1. 封面（1页）
2. 目录（1页）
3. 痛点/开场（2页）
4. 故事/时间线（5-8页）
5. 知识点讲解（4-6页）
6. 核心概念（3-4页）
7. 案例展示（4-6页）
8. 核心理念（2-3页）
9. 总结/行动（3-4页）
10. 结尾（1页）

## 归档

- PPT文件：`02_工作/汇报材料/` 或 `03_生活/学习记录/`
- 附件：`attachments/`
