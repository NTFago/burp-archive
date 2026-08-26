# 大邮集集模板（`bupt/`）使用说明

> 本文整理自对 `bupt/` 子模块源码的通读，以及官方示例仓库
> [bupt-example-chemistry](https://github.com/ArtveFlinaInBupt/bupt-example-chemistry) 的对照。
> 文末「完整 API 参考」列出了模板暴露的**全部**函数与变量。

## 1. 这是什么

`bupt/` 是**大邮集集模板**（Bigdu University Problemset Template），一个用
[Typst](https://typst.app) 排版「套题 / 题集」的模板。

- 本项目通过 git submodule 引入，固定于 commit `5e5bb3a`。
- 本地 Typst 版本：`0.15.1`。
- 官方 README 明确说明：**文档 WIP**，用法需参考示例仓库 `bupt-example-chemistry`。

**核心结论：它不是一个「拿来即用」的成品，而是一套排版引擎（函数库）。**
你需要自己补一份配置文件、一份 facade 绑定文件、一份入口文件和题目文件才能编译。

## 2. `bupt/` 目录内四个文件的分工

| 文件 | 作用 |
| --- | --- |
| `deps.typ` | 外部包声明：`fletcher`（流程图）、`fontawesome`（图标）、`itemize`（列表） |
| `model.typ` | `model-factory(config)` 工厂函数，**传入 `config` 返回一堆工具函数**：题目、填空、选项、表格、图等 |
| `common.typ` | 排版样式层（`show` 规则）：`styled-*` 系列 + 各 `show-*` 文档结构函数 |
| `util.typ` | 小工具：`tnum`、`hbox`、`attention-page`、`parse-inset` 等 |

## 3. 核心用法：模板只出「引擎」，配置由你提供

模板里没有任何字体、颜色、页边距的默认值，这些全部需要使用者自己定义。
官方示例的最小项目结构如下：

```
你的项目/
├── bupt/                 # 本 submodule
├── config.typ            # ① 配置：字体 / 颜色 / 间距 / 页脚
├── facade.typ            # ② 把 config 绑定进模板，导出简写
├── main.typ              # ③ 入口
├── cover.typ             # 封面（可选）
└── problemset/demo.typ   # ④ 题目文件
```

> 说明：本文示例统一使用 Typst 的**根路径**（以 `/` 开头，指项目根目录），
> 这样无论从哪一层子目录 `#include` / `#import` 都能正确解析。

### ① `config.typ` —— 唯一需要根据需求修改的地方

模板需要的 `config` 结构如下（字体按本机已安装的调整）：

```typst
#let spacing = (
  first-line-indent: 2em,
  line-leading: 1em,
  par-spacing: 1em,
  list-spacing: 1em,
  list-indent: 1em,
  terms-hanging-indent: 2em,
  problem-spacing: 1.25em,
  problem-line-leading: 1.25em,
  problem-par-spacing: 1.25em,
  table-inset: (x: 1em, y: .5em),
  margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
)

#let font = (
  en: "STIX Two Text",
  serif: ((name: "STIX Two Text", covers: "latin-in-cjk"), "Source Han Serif SC"),
  sans: ("Source Han Sans SC",),
  mono: ((name: "Fira Code", covers: "latin-in-cjk"),),
  math: ("STIX Two Math",),
)

#let color = (
  tint: (
    light: rgb("#FAF8FF"),
    _50: rgb("#F5F3FF"),
    _100: rgb("#EDE9FE"),
    _200: rgb("#DDD6FE"),
    _300: rgb("#C4B5FD"),
    _400: rgb("#A78BFA"),
    _500: rgb("#8B5CF6"),
    _600: rgb("#7C3AED"),
    _700: rgb("#6D28D9"),
    _800: rgb("#5B21B6"),
    _900: rgb("#4C1D95"),
    _950: rgb("#2E1065"),
    dark: rgb("#1E0A46"),
  ),
  error: red,
  warning: yellow,
  comment: gray,
  time: green,
  tag: blue,
  todo: yellow,
)

#let footer-content = align(horizon, text(size: .75em)[你的书名 – 副标题])

#let config = (
  spacing: spacing,
  font: font,
  color: color,
  footer-content: footer-content,
)
```

### ② `facade.typ` —— 把配置注入模板

```typst
#import "/bupt/common.typ" as bupt
#import "/bupt/model.typ": model-factory
#import "/bupt/util.typ": *
#import "/config.typ": *

// 把 config 绑定进 show 规则
#let set-document-metadata = bupt.set-document-metadata
#let indented-par        = bupt.indented-par.with(config)
#let show-foreword       = bupt.show-foreword.with(config)
#let show-outline        = bupt.show-outline.with(config)
#let show-body-start     = bupt.show-body-start.with(config)
#let show-body-file      = bupt.show-body-file.with(config)
#let show-appendix-start = bupt.show-appendix-start.with(config)
#let show-appendix-file  = bupt.show-appendix-file.with(config)

// 工具函数
#let m = model-factory(config)
#let p  = m.p         // 单题
#let ps = m.ps        // 多问，小写编号 (1)(2)(3)…
#let choices = m.choices
#let blank   = m.blank
#let marks   = m.marks
```

### ③ `main.typ` —— 入口，按「前言 / 目录 / 正文 / 附录」四段组织

```typst
#import "/facade.typ": *

#show: set-document-metadata.with(info: (
  author: "作者名",
  title: "书名",
  date: datetime.today(),
))

#show-foreword[
  = 前言
  ……
]

#show-outline[
  #outline(target: heading)
]

#show: show-body-start      // 正文起始：页码重置为 1，改阿拉伯数字
#include "/problemset/demo.typ"

#show: show-appendix-start  // 附录起始：页码切换为「附录」
#include "/appendix/xxx.typ"
```

### ④ 题目文件里怎么写题

每个被 `#include` 的题目文件，**开头加一行**：
- 正文文件：`#show: show-body-file`
- 附录文件：`#show: show-appendix-file`

然后：

```typst
#show: show-body-file

= 第一章 逆向工程基础

#p[ 这是一道题。 ]                        // 单题，自动编号 一、二、三…

#ps(                                      // 多问，编号 (1)(2)(3)
  [ 第一小问 ],
  [ 第二小问 ],
)

#p[ 选择题 ] [
  #choices[选项A][选项B][选项C][选项D]      // 自动排成 A. B. C. D.
]

#p[ 填空题：答案是 #blank。 ]              // 画一条填空横线

#p[ 这题 #marks(10)。 ]                    // 「（10 分）」
```

## 4. ⚠️ 一个必须注意的坑：示例仓库版本比本地老

官方示例 `bupt-example-chemistry` 里用的是 `bupt.show-appendix`，但本地 `bupt`
（commit `5e5bb3a`）已经经历了一次 **breaking change**——`show-appendix` 被拆成两个：

- `show-appendix-start`：切换附录页码 / 标题编号，放在 `main.typ`。
- `show-appendix-file`：套用样式，放在每个附录文件开头。

**不要照抄示例里的 `show-appendix`**，否则编译会报找不到函数。同理，正文也是
`show-body-start` + `show-body-file` 这一对。

## 5. 编译

```bash
typst compile main.typ
```

前提是 `config.typ` 里写的字体（Source Han Serif SC / STIX Two Text / Fira Code /
Font Awesome 等）**已安装到系统**，否则会回退或缺字。在 Windows 上若未安装这些字体，
可先把 `font` 字段替换为本机已有的中文字体（如思源黑体 / 微软雅黑）以先跑通流程。

## 6. 完整 API 参考

> 下面按文件列出模板暴露的**全部**顶层导出项。函数签名中的 `..args` 表示可变参数
> （命名参数 + 位置参数）。

### 6.1 `util.typ`（6 个自定义 + 3 个 re-export）

| 名称 | 签名 | 说明 |
| --- | --- | --- |
| `tnum` | `= text.with(number-width: "tabular")` | 等宽数字，用于表格数字对齐 |
| `hbox` | `hbox(body)` | 测量 `body` 高度后放入居中 box，行内垂直对齐 |
| `skipped-by-label` | `(label, count)` | 判断 `label` 是否落在第 `count` 页 |
| `skipped-header` | `= skipped-by-label.with(<skip-header>)` | 当前页是否跳过页眉（由一级标题插入） |
| `attention-page` | `(..args)` | 单独一页（无页眉 / 页码），内容居中，用于扉页 / 献词 |
| `parse-inset` | `(inset-got, default: none)` | 把 length / 字典 / `x` / `y` 形式的 inset 解析成四边字典 |
| `diagram` / `edge` / `node` | （re-export） | 从 `fletcher` 导入并透出，画图用 |

### 6.2 `model.typ` —— `model-factory(config)` 的返回（35 项，含 4 个别名）

调用方式：`#let m = model-factory(config)`，之后 `m.p` / `m.ps` 等；
或在 facade 里 `#let p = m.p` 后直接 `p(...)`。

**着色文本 / 标注类**

| 名称 | 签名 | 说明 |
| --- | --- | --- |
| `error` | `= text.with(fill: config.color.error)` | 红色错误文本 |
| `warning` | `= text.with(fill: config.color.warning)` | 黄色警告文本 |
| `comment` | `= text.with(fill: config.color.comment)` | 灰色注释文本 |
| `time` | `time(it)` | 加粗 + 绿色时间文本 |
| `tag` | `tag(it)` | `[#it]` 形式蓝色标签 |
| `todo` | `todo(it)` | 「TODO: …」描边标注框 |
| `quote` | `quote(body)` | 引用块（左侧色条 + 浅色底） |
| `refn` | `refn(pattern, ..args)` | 着色编号文本（等价于着色的 `numbering`） |

**题目类**

| 名称 | 别名 | 说明 |
| --- | --- | --- |
| `problem` | `p` | 题目，默认编号 `一、`；可用 `numbering:` 自定义编号序列；多段用多个位置参数 |
| `problem-alt` | `ps` | 多级题目，编号 `("一、", "(1)", "(i)")` |
| `problem-English` | `pe` | 英文编号 `("1.", "1)")` |

**填空 / 标记类**

| 名称 | 别名 | 说明 |
| --- | --- | --- |
| `blank-offset` | — | 填空线底部偏移量（常量） |
| `alt-blank` | — | `(ext, body)` 可变宽度填空（`ext` 额外宽度，`body` 要填内容） |
| `blank` | — | 固定 `3em` 宽的填空横线 |
| `circled` | — | `(num)` 带圈数字：1–20 用 `①②③…`，超出画圈 |
| `marks` | — | `(n)` → `（n 分）` |
| `marks-alt` | — | `(n)` → `(n marks)` |
| `choice-blank` | `cblank` | 选择题括号 `（　）` |

**列表 / 排版类**

| 名称 | 签名 | 说明 |
| --- | --- | --- |
| `choices` | `(..args)` | 选项排版；支持 `numbering:`、`columns:`、`align:` |
| `indented-list` | `(..args)` | 悬挂缩进列表（`title:` + 正文，`indent:` 控制缩进） |
| `make-heading` | `(tags:, title-text:, body)` | 生成标题并写入 metadata（供套题导航 / 页眉使用） |
| `smart-link` | `(quiet: false, dest, body)` | 目标存在则 `link`，否则告警或静默 |

**表格类**

| 名称 | 说明 |
| --- | --- |
| `htable` | 表头在**行**（首行加粗着色） |
| `vtable` | 表头在**列**（首列加粗着色） |
| `bi-table` | 双向表头（首行 + 首列） |
| `diag-cell` | `(..args)` 对角线单元格（表格左上角对角分割，两段文字各占一角） |

**图（fletcher）类**

| 名称 | 说明 |
| --- | --- |
| `edge-label-wrapper` | `(edge)` 边标签包装（取边色） |
| `node-label-wrapper` | `(label)` 节点标签包装 |
| `diagram-preset` | 图预设（节点 / 边默认样式） |
| `preset-edges` | 预设边：`edge` / `mutual-edge` / `self-edge` |

### 6.3 `common.typ`（25 个顶层绑定 + 2 个 state）

**状态（state）**

| 名称 | 说明 |
| --- | --- |
| `continued-table` | 跨页表格续表标记 |
| `page-both` | 页码是否显示「当前 / 总页」 |

**样式层（`styled-*`，均需 `.with(config)` 绑定后作为 `show` 规则使用）**

| 名称 | 作用范围 |
| --- | --- |
| `styled-text` | 正文字体 / 字号、中文标点（句号→`．`）、中西文间距 |
| `styled-par` | 段落行距、段距、两端对齐 |
| `styled-page` | 页边距、页眉（当前章标题）、页脚（页脚内容 + 页码） |
| `styled-outline` | 目录样式 |
| `styled-heading` | 标题样式（一级标题前分页、居中、超宽时缩放到一行） |
| `styled-figure` | 图表样式（表格类图表标题置顶） |
| `styled-math-equation` | 数学公式字体与间距 |
| `styled-enum-list` | 列表 / 术语表样式 |
| `styled-raw` | 代码块样式（行号 + 斑马纹） |
| `styled-table` | 表格默认样式 |
| `styled-hyper` | 链接 / 引用 / 引文的高亮下划线 |
| `styled-divider` | 分隔线样式 |
| `styled-universal` | 聚合调用上述大部分样式（正文通用） |

**文档结构（`show-*` 及配套，`show-*` 需 `.with(config)` 绑定）**

| 名称 | 说明 |
| --- | --- |
| `set-document-metadata` | `(info:, it)` 设置作者 / 标题 / 日期 |
| `indented-par` | 段落首行缩进 |
| `show-foreword` | 前言（罗马页码 `I`，重置页码） |
| `show-outline` | 目录 |
| `show-body-start` | 正文起始（页码 `1 / 1`，重置页码） |
| `show-body-file` | 正文文件（套样式 + 标题链接回目录） |
| `show-appendix-start` | 附录起始（标题编号「附录 A」，页码 `1·附录`） |
| `show-appendix-file` | 附录文件（套样式 + 首行缩进） |
| `link-to-outline` | `(body)` 给一级标题加「返回目录」链接 |
| `numbered-heading` | `(body)` 标题改为纯数字编号（无「章」前缀） |
