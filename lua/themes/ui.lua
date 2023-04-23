-- print("init ui")
-- ui
--
vim.cmd [[

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

]]

vim.opt.termguicolors = true
vim.cmd [[
syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme deus
"color deus
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
hi NonText ctermfg = gray guifg = grey10
hi SpecialKey ctermfg = blue guifg = grey70

"let background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
"color deus
"color gruvbox
"let ayucolor="light"
"color deus"
"color xcodelighthc
"set background=light
"set cursorcolumn
""
""set guicursor=n-c-v:ver50-ncvCursor
""set guicursor=i:block-iCursor-blinkon0,v:block-vCursor
""let g:indentLine_concealcursor = ''
""显示当前的行和列
""set cursorline cursorcolumn
""设置行列的颜色
"":highlight CursorLine guibg=lightblue ctermbg=lightgray
""改变光标的前景色和背景色
"":highlight Cursor guifg=white guibg=black
"":highlight iCursor guifg=white guibg=steelblue

]]


