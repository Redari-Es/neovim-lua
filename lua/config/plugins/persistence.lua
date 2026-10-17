return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{ "<leader>sl", function() require("persistence").load() end,                 desc = "恢复当前目录会话" },
		{ "<leader>sS", function() require("persistence").select() end,              desc = "选择会话恢复" },
		{ "<leader>sL", function() require("persistence").load({ last = true }) end, desc = "恢复上次会话" },
		{ "<leader>sd", function() require("persistence").stop() end,                desc = "退出时不保存会话" },
	},
}
