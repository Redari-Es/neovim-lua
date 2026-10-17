return {
	--database
	'tpope/vim-dadbod',
	'kristijanhusak/vim-dadbod-ui',
	'kristijanhusak/vim-dadbod-completion',
	'voldikss/vim-floaterm',


	lazy = false,
	priority = 1000,
	config = function()
		-- DBUI 配置
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_queries"
		vim.g.db_ui_auto_execute_table_helpers = 1

		-- 在 SQL/数据库缓冲区中启用 dadbod 补全
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				require("cmp").setup.buffer({
					sources = { { name = "vim_dadbod_completion" } },
				})
			end,
		})
	end,
}
