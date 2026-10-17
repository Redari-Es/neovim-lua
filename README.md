# nvim-mini

服务器环境使用的最小 Neovim 配置。与主配置（main 分支）共享同一套**基础设置**与**按键映射**，仅加载少量核心插件，保证在无图形、弱网络、无 root 的服务器上也能正常工作。

## 包含什么

| 模块 | 说明 |
|---|---|
| `lua/config/defaults.lua` | 基础设置（与 main 一致） |
| `lua/config/keymaps.lua` / `keymaps_shon.lua` | 按键映射（与 main 一致，colemak 布局） |
| `lua/config/plugins-mini.lua` | 核心插件集（见下） |
| `Ultisnips/` | 自定义代码片段 |

## 插件清单（13 个）

- **nvim-deus** — 配色
- **nvim-treesitter** — 语法高亮
- **nvim-lspconfig** — LSP（用系统自带的服务器二进制）
- **nvim-cmp** + cmp-nvim-lsp / cmp-buffer / cmp-path — 补全
- **ultisnips** + cmp-nvim-ultisnips — 片段
- **telescope.nvim** — 模糊查找（`<leader>ff/fg/fb/fh`）
- **gitsigns.nvim** — git 变更标记
- **nvim-autopairs** — 自动括号
- **Comment.nvim** — 注释（`gcc` / `gc`）
- **nvim-surround** — 包裹编辑
- **lualine.nvim** — 状态栏

## 使用

```sh
git clone -b mini <repo> ~/.config/nvim
nvim
```

首次启动 lazy.nvim 会自动克隆并安装插件；**无外网时自动降级**为纯配置模式（设置和按键照常可用）。

## 注意

- LSP 服务器请用系统包管理器安装（如 `gopls`、`lua-language-server`、`pyright`），不在 nvim 内自动下载
- UltiSnips 依赖 `python3`（`machine_specific.lua` 里可改 `python3_host_prog`）
