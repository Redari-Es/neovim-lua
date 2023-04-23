local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- Only jump to error
vim.keymap.set("n", "[D", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]D", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- Code Quickfix
vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, opts)
-- Code Outline
vim.keymap.set("n", "<leader>co", "<cmd>LSoutlineToggle<CR>", { silent = true })

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
  vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, bufopts)
  vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format { async = true } end, bufopts)

  --    require("lsp_signature").on_attach(signature_setup, bufnr)
end


local servers = {'clangd','gopls' ,'pyright', 'tsserver' ,'html',}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup( {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

local luasnip = require 'luasnip'

--[[
local cmp = require 'cmp'
cmp.setup {
snippet = {
expand = function(args)
luasnip.lsp_expand(args.body)
end,
},
mapping = cmp.mapping.preset.insert({
['<C-i>'] = cmp.mapping.scroll_docs(-4),
['<C-n>'] = cmp.mapping.scroll_docs(4),
['<C-e>'] = cmp.mapping.complete(),
['<C>'] = cmp.mapping.confirm {
behavior = cmp.ConfirmBehavior.Replace,
select = true,
},
['<Tab>'] = cmp.mapping(function(fallback)
if cmp.visible() then
cmp.select_next_item()
elseif luasnip.expand_or_jumpable() then
luasnip.expand_or_jump()
else
fallback()
end
end, { 'i', 's' }),
['<S-Tab>'] = cmp.mapping(function(fallback)
if cmp.visible() then
cmp.select_prev_item()
elseif luasnip.jumpable(-1) then
luasnip.jump(-1)
else
fallback()
end
end, { 'i', 's' }),
}),
sources = {
{ name = 'nvim_lsp' },
{ name = 'luasnip' },
},

}


--]]
require('lspconfig').pyright.setup{
  settings = {
    pyright = {
      disableLanguageServices = true,
      disableOrganizeImports  = true,
    }
  }
}
local function lsp_highlight_document(client)
  -- if client.server_capabilities.document_highlight then
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end
-- test
-- on_attach = function(client)
--   if client.server_capabilities.documentFormattingProvider then
--     vim.cmd(
--     [[
--     augroup LspFormatting
--     autocmd! * <buffer>
--     autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
--     augroup END
--     ]]
--     )
--   end
-- end

