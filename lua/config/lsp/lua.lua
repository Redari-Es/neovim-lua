return {
	setup = function()
		vim.lsp.config('lua_ls', {
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							'vim',
							'require'
						},
					},
					workspace = {
						checkThirdParty = false,
					},
					completion = {
						callSnippet = "Replace"
					}
				}
			}
		})
	end
}
