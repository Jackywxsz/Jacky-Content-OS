# 安装 Jacky Content OS

## 推荐方式

```bash
npx skills add Jackywxsz/Jacky-Content-OS
```

如果你的工具不支持 `npx skills add`，就手动复制需要的 skill。

## 手动复制

```bash
cp -R skills/jacky-content ~/.codex/skills/
cp -R skills/jacky-hook ~/.codex/skills/
cp -R skills/jacky-wiki ~/.codex/skills/
cp -R skills/jacky-de-ai ~/.codex/skills/
cp -R skills/jacky-xhs-check ~/.codex/skills/
```

## 环境变量

```bash
export JACKY_CONTENT_ROOT="$HOME/Documents/Jacky Content System"
export WIKI_ROOT="$HOME/Documents/知识库"
```

视觉生成工具已独立到 [`Jacky-Illustration`](https://github.com/Jackywxsz/Jacky-Illustration)，动画演示工具已独立到 [`Jacky-motion`](https://github.com/Jackywxsz/Jacky-motion)。

## 最小安装

只想体验主流程：

```bash
cp -R skills/jacky-content ~/.codex/skills/
```

只想优化开头：

```bash
cp -R skills/jacky-hook ~/.codex/skills/
```

只想做知识库沉淀：

```bash
cp -R skills/jacky-wiki ~/.codex/skills/
```
