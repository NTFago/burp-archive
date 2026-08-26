# BURP Archive

[![Build and Release](https://github.com/NTFago/burp-archive/actions/workflows/ci.yml/badge.svg)](https://github.com/NTFago/burp-archive/actions/workflows/ci.yml)

《大邮逆向集》收录北京邮电大学《汇编语言与逆向工程》课程往年题目的解题思路与相关练习附件。

## 本地构建

仓库使用 Git 子模块保存排版模板，首次克隆时需要一并拉取：

```bash
git clone --recurse-submodules https://github.com/NTFago/burp-archive.git
cd burp-archive
typst compile main.typ main.pdf
```

项目当前使用 Typst 0.15.1。完整排版还需要 `config.typ` 中声明的字体；CI 会自动下载并校验固定版本的开源字体。

## CI 与发版

`.github/workflows/ci.yml` 提供两层流程：

- Pull Request、`main` 分支提交和手动运行：编译 PDF，预览产物保留 14 天。
- `v*` 标签：在编译成功后创建 GitHub Release，上传带版本号的 PDF、附件包和 SHA-256 校验文件。

版本号采用 `vYYYY.MINOR.PATCH`：

- `YYYY`：内容所属的主要年度，例如 `2026`。
- `MINOR`：新增题目、章节或一批附件时递增。
- `PATCH`：修正答案、错别字或排版问题时递增。
- 候选版可追加后缀，例如 `v2026.1.0-rc.1`，CI 会将其标记为预发布。

正式发版前应先合并到 `main`，确认 Actions 构建通过且工作区干净，然后创建并推送带注释标签：

```bash
git switch main
git pull --ff-only
git status --short
git tag -a v2026.1.0 -m "BURP Archive v2026.1.0"
git push origin v2026.1.0
```

标签必须指向 `main` 已包含的提交，否则发版任务会拒绝执行。普通提交不生成永久 Release，构建出的 PDF 也不应提交到源码分支。
已发布版本的资产不会被覆盖；发布后如需修订，应递增 `PATCH` 并创建新标签。

> 注意：`bupt/` 是子模块。对子模块中文件的本地修改不会随父仓库提交；应先在子模块仓库提交并推送，再在本仓库提交更新后的子模块指针。
