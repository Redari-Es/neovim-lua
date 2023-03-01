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
  -- config
  'config.lsp-saga',
  "config.lsp-installer",
  'config.lsp-config',
  "config.cmp",
  --'config.nvim-cmp',
  "config.luasnip-config",
  'usermod.luasnip-key',
  'config.autopairs-conf',
  -- 'config.indent_blankline-conf',
  'config.mdpreview',
  'config.dap',
  "config.tree",
  --'config.go',
  --'config.golsp',
  --old-vim-config
  --
  'vim-config',

  -- testing
  --"config.treesitter-config",
  --  "config.telescope",
  "config.telescope-conf"
  -- "config.mdpreview",
}
for k,v in pairs(array) do
  require(v)
end

-- sources
--
