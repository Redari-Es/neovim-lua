--
-- load snippets made by luasnip
--require("snippets")
local luasnip = require("luasnip")
local cmp = require("cmp")
--
--
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup({
  onattach = onattach,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  --[[
  mapping = cmp.mapping.preset.insert( {
  ["<C-u>"] = cmp.mapping.select_prev_item(),
  ["<C-e>"] = cmp.mapping.select_next_item(),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = false
  }),
  ["<C-e>"] = cmp.mapping(function()
  luasnip.jump(1)
  end, { "i", "s" }),
  ["<C-u>"] = cmp.mapping(function()
  luasnip.jump(-1)
  end, { "i", "s" }),
  ["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
  cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
  luasnip.expand_or_jump()
  else
  fallback()
  end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
  cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
  luasnip.jump(-1)
  else
  fallback()
  end
  end, { "i", "s" }),
  }),
  --]]


  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer",keyword_length=2,max_item_count=10, },
    {name = "look"},
    {name = "path"},
    {name = "cmp_tabnine"},
    {name = "calc"},
    {name = "spell"},
    {name = "emoji",insert = true},
  }),

})
--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})

require("nvim-autopairs").setup()

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())



-- temporary disable cmp for markdown
vim.cmd([[
autocmd FileType markdown lua require('cmp').setup.buffer { enabled = true }
]])


--注释
cmp.setup {
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding =0,
      scrollbar=true,
    },
    documentation={
      zindex=-4,
      max_width=60,
      max_height=30,
    },
  },
  view={
    entries={name='custom',selection_order='cursor'}

  },



  -- formatting = {
  --   fields = { "abbr","menu","kind"},
  --     format = function(entry, vim_item)
  --       if vim.tbl_contains({ 'path' }, entry.source.name) then
  --         local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
  --         if icon then
  --           vim_item.kind = icon
  --           vim_item.kind_hl_group = hl_group
  --           return vim_item
  --         end
  --       end
  --       return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
  --     end
  --   },


  formatting ={

    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50,ellipsis_char='...', })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"
      return kind
    end,
  },

  --
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_prev_item(),
    ["<C-i>"] = cmp.mapping.select_next_item(),
    ["<C-Tab>"] = cmp.mapping.select_next_item(),
    ["<C-N>"] = cmp.mapping.scroll_docs(-4),
    ["<C-I>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping.close(),
    -- ["<C-Space>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end
  },
  sources = {
    {name="ultisnips"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "luasnip"},

    -- {name='snippy'},
    {
      name = "buffer",
      options = {
        get_bufnrs = function()

          return vim.api.nvim_list_bufs()
        end
      }
    },
    {name = "look"},
    {name = "path"},
    {name = "cmp_tabnine"},
    -- {name = "calc"},
    {name = "spell"},
  },
}
cmp.setup.cmdline('/',{
  sources={
    {name = 'buffer'}
  }
})
cmp.setup.cmdline(':',{
  sources=cmp.config.sources({
    {name='path'}
  }, {
    {name='cmdline'}
  })

})


--]]
--
-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- capabilities = capabilities
-- }
--


--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu

vim.cmd([[
highlight! link CmpItemMenu Comment
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])

