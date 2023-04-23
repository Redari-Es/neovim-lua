local lspsaga = require 'lspsaga'
-- lspsaga.init_lsp_saga()
lspsaga.setup { -- defaults ...
debug = false,
use_saga_diagnostic_sign = true,
-- diagnostic sign
error_sign = "",
warn_sign = "",
hint_sign = "",
infor_sign = "",
diagnostic_header_icon = " ",
-- code action title icon
code_action_icon = "",
code_action_prompt = {
  enable = true,
  sign = true,
  sign_priority = 40,
  virtual_text = true,
},
finder_definition_icon = "  ",
finder_reference_icon = "  ",
max_preview_lines = 10,
finder_action_keys = {
  open = "o",
  vsplit = "s",
  split = "i",
  quit = "q",
  scroll_down = "<C-f>",
  scroll_up = "<C-b>",
},
code_action_keys = {
  quit = "q",
  exec = "<CR>",
},
rename_action_keys = {
  quit = "<C-c>",
  exec = "<CR>",
},
definition_preview_icon = "  ",
border_style = "single",
rename_prompt_prefix = "➤",
server_filetype_map = {},
diagnostic_prefix_format = "%d. ",
}
--[[
lsp_keybinds.set_keymap = function (bufnr)
  print("set lsp keymap")
  -- 跳转到声明
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga peek_definition<CR>", {silent = true, noremap = true})
  -- 跳转到定义
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
  -- 显示注释文档
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true, noremap = true})
  -- 跳转到实现
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
  -- 跳转到引用位置
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
  -- 以浮窗形式显示错误
  vim.api.nvim_buf_set_keymap(bufnr, "n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
end
--[[
--- In lsp attach function
local map = nvim_buf_set_keymap,
map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
--]]
