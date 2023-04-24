vim.cmd[[

" Coc 指定使用 nvim-cmp
let g:coc_source_completeOpt = 'menu,menuone,noselect'
inoremap <expr> <c-space> coc#refresh()
" 禁用 Coc 自带的自动完成
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" 禁用 nvim-cmp 的 Tab 键自动完成
let g:cmp_mapping.select_next_item = ''
let g:cmp_mapping.select_prev_item = ''
" 禁止 nvim-cmp 在 coc.nvim 缓冲区中自动触发
autocmd FileType coc.nvim setlocal omnifunc=v:lua.vim.lsp.omnifunc
]]
