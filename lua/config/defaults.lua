vim.o.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Shon which is myself
--[[
local set = {
	ttyfast = true,
	autochdir = true,
	exrc = true,
	secure = false,
	number = true,
	relativenumber = true,
	cursorline = true,
	expandtab = false,
	tabstop = 2,
	smarttab = true,
	shiftwidth = 2,
	softtabstop = 2,
	autoindent = true,
	autoread = true,
	list = true,
	listchars = 'eol:↴,tab:|\\ ,trail:▫',
	scrolloff = 4,
	ttimeoutlen = 0,
	timeout = false,
	viewoptions = 'cursor,folds,slash,unix',
	wrap = true,
	textwidth = 0,
	indentexpr = '',
	foldmethod = 'indent',
	foldlevel = 99,
	foldenable = true,
	foldlevelstart = 99,
	splitright = true,
	splitbelow = true,
	showmode = false,
	ignorecase = true,
	smartcase = true,
	inccommand = 'split',
	completeopt = 'menuone,noinsert,noselect,preview',
	lazyredraw = true,
	visualbell = true,
	colorcolumn = '100',
	updatetime = 100,
	virtualedit = 'block',
	ambw = 'double',
	concealcursor = "",
	enc = 'utf-8',
	title = true,
	helplang = 'cn',
	showcmd = true,
	-- mouse = 'a',
	history = 1000,


}
for k, v in pairs(set) do
	vim.opt[k] = v
end
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
--]]
--
-- TheCW
vim.o.ttyfast = true
vim.o.autochdir = true
vim.o.exrc = true
vim.o.secure = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:|\\ ,trail:▫'
vim.o.scrolloff = 4
vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.inccommand = 'split'
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.o.completeopt = 'menuone,noinsert,noselect,preview'
-- vim.o.lazyredraw = true
vim.o.visualbell = true
vim.o.colorcolumn = '100'
vim.o.updatetime = 100
vim.o.virtualedit = 'block'

--]]
-- color
vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })

vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.g.terminal_color_0  = '#000000'
vim.g.terminal_color_1  = '#FF5555'
vim.g.terminal_color_2  = '#50FA7B'
vim.g.terminal_color_3  = '#F1FA8C'
vim.g.terminal_color_4  = '#BD93F9'
vim.g.terminal_color_5  = '#FF79C6'
vim.g.terminal_color_6  = '#8BE9FD'
vim.g.terminal_color_7  = '#BFBFBF'
vim.g.terminal_color_8  = '#4D4D4D'
vim.g.terminal_color_9  = '#FF6E67'
vim.g.terminal_color_10 = '#5AF78E'
vim.g.terminal_color_11 = '#F4F99D'
vim.g.terminal_color_12 = '#CAA9FA'
vim.g.terminal_color_13 = '#FF92D0'
vim.g.terminal_color_14 = '#9AEDFE'
vim.cmd([[autocmd TermOpen term://* startinsert]])
vim.cmd([[
augroup NVIMRC
    autocmd!
    autocmd BufWritePost .vim.lua exec ":so %"
augroup END
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
]])

vim.cmd([[
"hi NonText ctermfg=gray guifg=grey10
hi NonText ctermfg = blue guifg = grey10
hi SpecialKey ctermfg = blue guifg = grey70
hi CursorLineNr guifg = #ff770f
"mutt
au BufRead /tmp/mutt-* set tw=72  ""tw=zh
let g:neoterm_autoscroll = 1
""test
let g:indentLine_concealcursor = ''
,
]])


local config_path = vim.fn.stdpath("config")
local current_config_path = config_path .. "/lua/config/machine_specific.lua"
if not vim.loop.fs_stat(current_config_path) then
	local current_config_file = io.open(current_config_path, "wb")
	local default_config_path = config_path .. "/default_config/_machine_specific_default.lua"
	local default_config_file = io.open(default_config_path, "rb")
	if default_config_file and current_config_file then
		local content = default_config_file:read("*all")
		current_config_file:write(content)
		io.close(default_config_file)
		io.close(current_config_file)
	end
end
require("config.machine_specific")
