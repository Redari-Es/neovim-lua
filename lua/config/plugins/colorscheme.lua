return {
	"theniceboy/nvim-deus",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme deus]])

		-- LSP 浮窗（诊断 / hover / signature）透明化：
		-- FloatBorder/NormalFloat 链接到 Normal，去掉黑边黑底，与编辑器融为一体
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

		-- 所有浮窗启用轻微透明（winblend 0-100，越大越透明）
		vim.api.nvim_create_autocmd("WinNew", {
			callback = function()
				vim.schedule(function()
					local win = vim.api.nvim_get_current_win()
					if vim.api.nvim_win_is_valid(win) then
						local cfg = vim.api.nvim_win_get_config(win)
						if cfg.relative ~= "" then
							vim.api.nvim_set_option_value("winblend", 10, { win = win })
						end
					end
				end)
			end,
		})
	end,
}
