vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 文件为go则设置;->:
-- 检测文件类型为go,kt,xml
vim.cmd([[autocmd FileType go,kt,xml inoremap ; :]])
vim.cmd([[autocmd FileType go,kt,xml inoremap : ;]])
-- vim.cmd([[autocmd FileType md set tw=80]])
-- vim.cmd([[autocmd FileType tsx inoremap ; :]])
vim.cmd([[autocmd FileType tsx inoremap : ;]])
vim.cmd([[autocmd FileType jsx inoremap ; :]])
vim.cmd([[autocmd FileType jsx inoremap : ;]])
vim.cmd([[autocmd FileType lua inoremap ; :]])
vim.cmd([[autocmd FileType lua inoremap : ;]])



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Opening a terminal window
map('', '<LEADER>/', ':set splitbelow<CR>:split<CR>:res +3<CR>:term<CR>', opts)
-- Call figlet
map('', 'tx', ':r !figlet', opts)
-- Press space twice to jump to the next '    ' and edit it
map('', '<LEADER><LEADER>', '<Esc>/<++><CR>:nohlsearch<CR>c4l', opts)
-- for c language eof
map('i', '<space>;', '<esc>A;<esc>o', opts)
map('i', '<space><Tab>', '<esc>A<Tab><Tab><Tab><Tab>//', opts)
-- find and replace
map('', '\\s', ':%s//g<left><left>', opts)
