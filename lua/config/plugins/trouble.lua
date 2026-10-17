return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "工作区诊断" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "当前缓冲区诊断" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "符号列表" },
		{ "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP 定义/引用" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                              desc = "Quickfix" },
	},
	opts = {
		focus = true, -- 打开后聚焦到列表
	},
}
