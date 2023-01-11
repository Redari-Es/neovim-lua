--
-- load snippets made by luasnip
--require("snippets")
local luasnip = require("luasnip")
local cmp = require("cmp")

--
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
        { name = "buffer" },
    {name = "look"},
    {name = "path"},
    {name = "cmp_tabnine"},
   -- {name = "calc"},
    {name = "spell"},
    {name = "emoji"}
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


--[[
cmp.setup {
  formatting = {
    format = cmpFormat1
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.select_prev_item(),
    ["<C-e>"] = cmp.mapping.select_next_item(),
    ["<C-n>"] = cmp.mapping.scroll_docs(-4),
    ["<C-i>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-y>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
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
    {name = "nvim_lsp"},
    {name = "luasnip"}, --{name = "nvim_lua"},
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
    {name = "emoji"}
  }
}
--]]


