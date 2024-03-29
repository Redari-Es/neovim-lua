--
vim.cmd[[
let g:neoterm_autoscroll=1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
""
augroup NVIMRC
autocmd!
autocmd BufWritePost *.nvimrc exec ":so %"
augroup END

]]

--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 文件为go则设置;->:
-- 检测文件类型为go,kt,xml
vim.cmd([[autocmd FileType go,kt,xml inoremap ; :]])
vim.cmd([[autocmd FileType go,kt,xml inoremap : ;]])
vim.cmd([[autocmd FileType md set tw=80]])

-- 映射键位
-- vim.api.nvim_buf_set_keymap(0, 'n', ';', ':', { noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, 'n', ':', ';', { noremap = true, silent = true })
--
local map = vim.api.nvim_set_keymap
local opts = {noremap = true,silent = true}
--
-- colemak
map('','u','k',opts)
map('','e','j',opts)
map('','n','h',opts)
map('','i','l',opts)
map('','gu','gk',opts)
map('','ge','gj',opts)
map('','\\v','v$h',opts)
map('','U','5k',opts)
map('','E','5j',opts)
-- set h (same as n, cursor left) to 'end of word'
map('','h','e',opts)
-- -- go to the start of the line
map('','N','0',opts)
-- -- go to the end of the line
map('','I','$',opts)



-- U/E K/J keys for 5 times u/e (faster navigation)
map('','W','8w',opts)
map('','B','8b',opts)
--
map('','Q',':q!<CR>',opts)
map('','<C-q>',':qa<CR>',opts)
map('','S',':w<CR>',opts)
map('','<LEADER>rc',':e $HOME/.config/nvim/init.vim<CR>',opts)
map('','<LEADER>rv',':e $HOME/.config/nvim/init.lua<CR>',opts)
map('','<LEADER>st',':Startify<CR>',opts)
-- undo operations
map('','l','u',opts)
-- k>i inserd mode
map('','k','i',opts)
map('','K','I',opts)
-- make Y to copy till the end of the line
map('n','Y','y$',opts)
-- Copy to system clipboard
map('v','Y','\"+y',opts)
-- Indentation
map('n','<','<<',opts)
map('n','>','>>',opts)
-- Search
map('','<LEADER><CR>',':nohlsearch<CR>',opts)
-- Space to Tab
map('n','<LEADER>tt',':%s/    /\t/g',opts)
map('v','<LEADER>tt',':s/    /\t/g',opts)
-- Folding
map('','<silent><LEADER>o','za',opts)

map('n','<Leader>w', ':write<CR>', {noremap = true})

-- Ctrl + U/K or E/J will move up/down the view port without moving the cursor
map('','<C-U>','5<C-y>',opts)
map('','<C-E>','5<C-e>',opts)

-- Insert Mode Cursor Movement
map('i','<C-a>','<ESC>A',opts)

-- for c language eof
map('i','<space>;','<esc>A;<esc>o',opts)
map('i','<space><Tab>','<esc>A<Tab><Tab><Tab><Tab>//',opts)

-- Command Mode Cursor Movement
map('c','<C-a>','<Home>',opts)
map('c','<C-e>','End',opts)
map('c','<C-p>','Up',opts)
map('c','<C-n>','<Down>',opts)
map('c','<C-b>','<Left>',opts)
map('c','<C-f>','<Right>',opts)
map('c','<M-b>','<S-Left>',opts)
map('c','<M-w>','<Right>',opts)

-- Disable the default s key
map('','s','<nop>',opts)
-- Searching
map('','-','N',opts)
map('','=','n',opts)
-- Window management
-- 窗口移动光标
-- Use <space> + new arrow keys for moving the cursor around windows
map('','<LEADER>w','<C-w>w',opts)
map('','<LEADER>u','<C-w>k',opts)
map('','<LEADER>e','<C-w>j',opts)
map('','<LEADER>n','<C-w>h',opts)
map('','<LEADER>i','<C-w>l',opts)
map('','qf','<C-w>o',opts)
--split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical) 用于分割窗口
map('','su',':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>',opts)
map('','se',':set splitbelow<CR>:split<CR>',opts)
map('','sn',':set nosplitright<CR>:vsplit<CR>:set splitright<CR>',opts)
map('','si',':set splitright<CR>:vsplit<CR>',opts)
-- Resize splits with arrow keys 调整窗口大小
map('','<up>',':res +5<CR>',opts)
map('','<down>',':res -5<CR>',opts)
map('','<left>',':vertical resize-5<CR>',opts)
map('','<right>',':vertical resize+5<CR>',opts)
-- Place the two screens up and down
map('','sh','<C-w>t<C-w>K',opts)
map('','sv','<C-w>t<C-w>H',opts)
-- Rotate screens
map('','srh','<C-w>b<C-w>K',opts)
map('','srv','<C-w>b<C-w>K',opts)
-- Press <SPACE> + q to close the window below the current window
map('','<LEADER>q','<C-w>j:q<CR>',opts)
-- Tab management
map('','tu',':tabe<CR>',opts)
map('','tn',':-tabnext<CR>',opts)
map('','ti',':+tabnext<CR>',opts)
map('','tmn',':-tabmove<CR>',opts)
map('','tmi',':+tabmove<CR>',opts)

-- Move the next character to the end of the line with ctrl+9
map('i','<C-u>','<ESC>lx$p',opts)
-- Opening a terminal window
map('','<LEADER>/',':set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>',opts)
-- Press space twice to jump to the next '    ' and edit it
map('','<LEADER><LEADER>','<Esc>/<++><CR>:nohlsearch<CR>c4l',opts)
-- Spelling Check with <space>sc
map('','<LEADER>sc','set spell!<CR>',opts)
--
-- Press ` to change case (instead of ~)
map('','`','~',opts)
--
map('','<C-c>','zz',opts)
-- Call figlet
map('','tx',':r !figlet',opts)
-- find and replace
map('','\\s',':%s//g<left><left>',opts)
-- Open a new instance of st with the cwd
map('n','\\t',':tabe<CR>:-tabmove<CR>:term sh -c \'st\'<CR><C-\\><C-N>:q<CR>',opts)
--  Adjacent duplicate words
map('','<LEADER>dw','/\\(\\<\\w\\+\\>\\)\\_s*\\1',opts)
--
map('','<LEADER>-',':lN<CR>',opts)
map('','<LEADER>=',':lne<CR>',opts)
-- set wrap
map('','<LEADER>sw',':set wrap<CR>',opts)


vim.cmd[[
noremap \g :git
noremap <c-g> :tabe<cr>:-tabmove<cr>:term lazygit<cr>
"noremap <leader>- :ln<cr>
"noremap <leader>= :lne<cr>
"find pair
noremap , . %
vnoremap ki $%
" insert a pair of {} and go to the next line
inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko
""noremap <silent> <LEADER>o za
""open up lazygit

]]

vim.cmd[[
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
]]

