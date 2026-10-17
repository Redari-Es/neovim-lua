return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPost",
	opts = {
		keywords = {
			FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		},
	},
	keys = {
		{ "<leader>xt", "<cmd>TodoTrouble<cr>",      desc = "TODO 列表(Trouble)" },
		{ "<leader>xT", "<cmd>TodoTelescope<cr>",    desc = "TODO 搜索(Telescope)" },
	},
}
