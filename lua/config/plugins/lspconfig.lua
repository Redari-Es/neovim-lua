local M = {}

local F = {}

local documentation_window_open = false

M.config = {
	{
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu',
	},
	{
		-- nvim-lspconfig 现在通过原生 vim.lsp.config() 提供服务器定义，
		-- 不再需要 lsp-zero 垫片（已归档，且内部仍调用被弃用的 lspconfig.xxx.setup）
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'mason-org/mason.nvim',
				build = function()
					vim.cmd([[MasonInstall]])
				end,
			},
			{ 'mason-org/mason-lspconfig.nvim' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{
				'j-hui/fidget.nvim',
				tag = "legacy"
			},
			"ray-x/lsp_signature.nvim",
			"ldelossa/nvim-dap-projects",
			{
				"lvimuser/lsp-inlayhints.nvim",
				branch = "anticonceal",
			},
			"MunifTanjim/prettier.nvim",
			"airblade/vim-rooter",
			"b0o/schemastore.nvim",
		},

		config = function()
			-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			-- 对所有 LSP server 生效的默认配置（替代 lsp-zero 的 set_server_config）
			vim.lsp.config('*', {
				capabilities = capabilities,
			})

			require('mason').setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
			-- mason-lspconfig v2：ensure_installed + automatic_enable 走原生 vim.lsp.config
			-- dartls 由 flutter-tools 自行管理；custom_elements_ls 的 lspconfig 定义缺少
			-- filetypes 限制，automatic_enable 下会 attach 到所有缓冲区
			require('mason-lspconfig').setup({
				ensure_installed = {
					'lua_ls',
					'ts_ls',
					'eslint',
					'gopls',
					'jsonls',
					'html',
					'clangd',
					'dockerls',
					'ansiblels',
					'terraformls',
					'texlab',
					'pyright',
				},
				automatic_enable = {
					exclude = { 'dartls', 'custom_elements_ls' },
				},
			})

			require("config.lsp.lua").setup()
			require("config.lsp.json").setup()
			require("config.lsp.flutter").setup()
			require("config.lsp.html").setup()

			vim.lsp.config('terraformls', {})
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = { "*.tf", "*.tfvars", "*.lua" },
				callback = function()
					vim.lsp.buf.format()
				end,
			})
			vim.lsp.config('yamlls', {
				settings = {
					redhat = {
						telemetry = {
							enabled = false
						}
					},
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						-- schemas = require('schemastore').yaml.schemas(),
						validate = false,
						customTags = {
							"!fn",
							"!And",
							"!If",
							"!Not",
							"!Equals",
							"!Or",
							"!FindInMap sequence",
							"!Base64",
							"!Cidr",
							"!Ref",
							"!Sub",
							"!GetAtt",
							"!GetAZs",
							"!ImportValue",
							"!Select",
							"!Split",
							"!Join sequence"
						}
					},
				}
			})

			-- 诊断配置（合并自原 lsp-zero preset 的 configure_diagnostics 与 on_attach 中的配置）
			vim.diagnostic.config({
				severity_sort = true,
				underline = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = '✘',
						[vim.diagnostic.severity.WARN] = '▲',
						[vim.diagnostic.severity.HINT] = '⚑',
						[vim.diagnostic.severity.INFO] = '»',
					},
				},
				virtual_text = false,
				update_in_insert = false,
				float = { border = 'rounded' },
			})
			if vim.o.signcolumn == 'auto' then
				vim.opt.signcolumn = 'yes'
			end

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'lsp on_attach',
				callback = function(event)
					local bufnr = event.buf
					require("config.plugins.autocomplete").configfunc()
					if vim.bo[bufnr].filetype ~= "dart" then
						require("lsp_signature").on_attach(F.signature_config, bufnr)
					end
				end,
			})

			require("fidget").setup({})

			require('nvim-dap-projects').search_project_config()

			F.configureDocAndSignature()
			F.configureKeybinds()

			local prettier = require("prettier")

			prettier.setup({
				bin = 'prettierd',
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
				cli_options = {
					arrow_parens = "always",
					bracket_spacing = true,
					bracket_same_line = false,
					embedded_language_formatting = "auto",
					end_of_line = "lf",
					html_whitespace_sensitivity = "css",
					-- jsx_bracket_same_line = false,
					jsx_single_quote = false,
					print_width = 80,
					prose_wrap = "preserve",
					quote_props = "as-needed",
					semi = true,
					single_attribute_per_line = false,
					single_quote = false,
					tab_width = 2,
					trailing_comma = "es5",
					use_tabs = false,
					vue_indent_script_and_style = false,
				},
			})

			local format_on_save_filetypes = {
				dart = true,
				json = true,
				go = true,
				lua = true,
				html = true,
				javascript = true,
				typescript = true,
				typescriptreact = true,
				c = true,
				cpp = true,
				objc = true,
				objcpp = true,
				dockerfile = true,
				terraform = true,
				tex = true,
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					if format_on_save_filetypes[vim.bo.filetype] then
						local lineno = vim.api.nvim_win_get_cursor(0)
						vim.lsp.buf.format({ async = false })
						pcall(vim.api.nvim_win_set_cursor, 0, lineno)
					end
				end,
			})
		end
	},
}

F.configureInlayHints = function()
	require("lsp-inlayhints").setup({
		inlay_hints = {
			parameter_hints = {
				show = true,
				prefix = "<- ",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = true,
			},
			type_hints = {
				-- type and other hints. Note that type hints
				-- shown before parameter
				show = true,
				prefix = "",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = false,
			},
			only_current_line = false,
			-- separator between types and parameter hints. Note that type hints are
			-- shown before parameter
			labels_separator = "  ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			highlight = "Comment",
		},
	})
end

F.configureDocAndSignature = function()
	-- vim.lsp.with() was removed in Nvim 0.12; wrap the handler and merge the
	-- config ourselves instead.
	local signature_cfg = {
		-- silent = true,
		focusable = false,
		border = "rounded",
		zindex = 60,
	}
	vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
		vim.lsp.handlers.signature_help(err, result, ctx, vim.tbl_deep_extend("force", config or {}, signature_cfg))
	end
	local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		pattern = "*",
		callback = function()
			if not documentation_window_open then
				vim.diagnostic.open_float(0, {
					scope = "cursor",
					focusable = false,
					zindex = 10,
					close_events = {
						"CursorMoved",
						"CursorMovedI",
						"BufHidden",
						"InsertCharPre",
						"InsertEnter",
						"WinLeave",
						"ModeChanged",
					},
				})
			end
		end,
		group = group,
	})
	-- vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
	-- 	pattern = "*",
	-- 	command = "silent! lua vim.lsp.buf.signature_help()",
	-- 	group = group,
	-- })

	-- F.signature_config = {
	-- 	bind = false,
	-- 	floating_window = true,
	-- 	hint_inline = function() return false end,
	-- 	handler_opts = {
	-- 		border = "rounded"
	-- 	}
	-- }
	-- local lspsignature = require('lsp_signature')
	-- lspsignature.setup(F.signature_config)
end

local documentation_window_open_index = 0
local function show_documentation()
	documentation_window_open_index = documentation_window_open_index + 1
	local current_index = documentation_window_open_index
	documentation_window_open = true
	vim.defer_fn(function()
		if current_index == documentation_window_open_index then
			documentation_window_open = false
		end
	end, 500)
	vim.lsp.buf.hover()
end

F.configureKeybinds = function()
	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			local opts = { buffer = event.buf, noremap = true, nowait = true }

			vim.keymap.set('n', '<leader>h', show_documentation, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			-- vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
			vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)
			-- vim.keymap.set('x', '<leader>aw', vim.lsp.buf.range_code_action, opts)
			-- vim.keymap.set('x', "<leader>,", vim.lsp.buf.range_code_action, opts)
			vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
			vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
			vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)

			-- 原 lsp-zero default_keymaps 提供、configureKeybinds 未覆盖的按键
			vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
			vim.keymap.set('x', '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
			vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
		end
	})
end

return M
