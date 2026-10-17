-- mini 版插件集：面向服务器环境，少量核心插件
-- 无网络 / 无 git 时自动降级为纯配置模式（基础设置与按键仍然生效）

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.notify("lazy.nvim 克隆失败（无外网？），以无插件模式启动\n" .. out, vim.log.levels.WARN)
		return
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 配色（与主配置一致）
	{
		"theniceboy/nvim-deus",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme deus]])
		end,
	},

	-- 语法高亮
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 100,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c", "lua", "vim", "vimdoc", "query",
					"go", "gomod", "python", "bash", "rust",
					"json", "yaml", "markdown", "markdown_inline",
				},
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
	},

	-- 补全（LSP + 片段 + 缓冲区/路径）
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
		config = function()
			-- 与主配置一致的 UltiSnips 按键
			vim.g.UltiSnipsExpandTrigger = "<c-e>"
			vim.g.UltiSnipsJumpForwardTrigger = "<c-u>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<c-e>"
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-o>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "ultisnips" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- LSP（使用系统自带的服务器二进制，不装 mason，节省服务器资源）
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })
			vim.lsp.enable({
				"lua_ls", "gopls", "pyright", "bashls",
				"rust_analyzer", "clangd", "ts_ls", "jsonls", "yamlls",
			})
		end,
	},

	-- 模糊查找
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "查找文件" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "全局搜索" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "缓冲区列表" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "帮助" },
		},
	},

	-- git 变更标记
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {},
	},

	-- 自动括号
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- 注释
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n" },
			{ "gc",  mode = { "n", "v" } },
		},
		config = function()
			require("Comment").setup()
		end,
	},

	-- 包裹编辑
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- 状态栏
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {},
	},
}, {
	defaults = { lazy = true },
	checker = { enabled = false }, -- 服务器上不自动检查更新
	change_detection = { notify = false },
})
