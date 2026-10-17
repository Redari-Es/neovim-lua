return {
	"retran/meow.yarn.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	cmd = "MeowYarn",
	keys = {
		{ "<leader>mt", "<cmd>MeowYarn type super<cr>",  desc = "类型层级（父类型）" },
		{ "<leader>mT", "<cmd>MeowYarn type sub<cr>",    desc = "类型层级（子类型）" },
		{ "<leader>mc", "<cmd>MeowYarn call callers<cr>", desc = "调用层级（谁调用了它）" },
		{ "<leader>mC", "<cmd>MeowYarn call callees<cr>", desc = "调用层级（它调用了谁）" },
		{ "<leader>ml", "<cmd>MeowYarn last<cr>",        desc = "重开上次的层级视图" },
	},
	config = function()
		require("meow.yarn").setup({})
	end,
}
