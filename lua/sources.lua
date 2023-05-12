-- print("init source")
--
local array = {
	"checks.check-first",
	-- basic
	"basic",
	--"usermod.settings",
	"usermod.keys",
	"plugins.packer",
	"plugins.vim-plug",
	"themes.ui",
	-- 'config.'
	'config.dap',
	"config.tree",
	-- 'config.go',
	--'config.golsp',
	--old-vim-config
	--
	'vim-config',
	-- fix
	'fix.handlers',
	-- 'fix.coc-npm',
	-- 'fix.code',
	-- lazy

	--cmp
	"config.cmp",
	--'config.nvim-cmp',
	-- code
	'config.mdpreview',
	'config.lsp-saga',
	"config.lsp-installer",
	'config.lsp-config',
	"config.luasnip-config",
	'usermod.luasnip-key',
	'config.autopairs-conf',
	-- 'config.indent_blankline-conf',
	-- testing
	--"config.treesitter-config",
	-- "config.telescope",
	"config.telescope-conf"
}
for k,v in pairs(array) do
	require(v)
end

-- sources
--
