-- print("init basic")

-- basic settings
local set = {
	number = true,
	relativenumber = true,
	showtabline = 2,
	wrap = true, -- default on
	wrapscan = true, -- default on
	autochdir=ture,
	tabstop = 2,
	-- expandtab = true,
	shiftwidth = 2,
	--noexpandtab=true,
	-- softtabstop = -1,
	softtabstop = 2,
	smartindent = true,
	autoindent = true,
	cindent = true,
	secure=true,
	sidescroll = 1,
	list = true,
	listchars = "eol:↴,tab:| ,trail:▫",
	viewoptions="cursor,curdir,folds,slash,unix",
	cursorline = true,
	cursorcolumn = false,
	-- coc
	pumblend=15,
	pumheight=12,
	--
	backspace = '2',
	showmode = true,
	mouse = 'a',
	ignorecase = true,
	smartcase = true,
	cmdheight = 1,
	conceallevel = 1,
	concealcursor = "",
	-- 拼写检查
	spelllang = 'en_us',
	-- spell = true,
	fileencoding =  'utf-8',
	fileformat = 'unix',
	fencs = 'utf8,gbk,gb2312',
	enc = 'utf-8',
	ambw = 'double',
	-- ambw = 'single',

	autoread = true,
	ruler = true,
	matchtime = 1,
	showmatch = true,
	scrolloff =10,--999 -10
	--
	ttimeoutlen = 0,
	timeout = false, -- set notimeout, if you use vim-which-key
	title = true,
	-- tw = 80,
	tw = 0, --default
	-- indentexpr="=",
	indentexpr="",
	helplang = 'cn',
	--
	foldmethod = 'indent',
	foldlevel = 99,
	foldenable = true,
	-- formatoptions = '-=tcqj',
	splitright = true,
	splitbelow = true,
	--noshowmod
	showcmd = true,
	wildmenu = true,
	inccommand = 'split',
	completeopt = 'longest,noinsert,menuone,noselect,preview',
	ttyfast = true,
	visualbell = true,
	--
	-- columns=80,
	colorcolumn = '100',
	updatetime = 100,
	virtualedit = 'block',
	lazyredraw = true,
	--
	history = 1000,




}
vim.opt.shortmess:append 'c'
-- 迭代设置
for k, v in pairs(set) do
	vim.opt[k] = v
end
-- cannot2lua
vim.cmd [[
set re=0
set shell=zsh\ -i
syntax enable
"触摸板
"set mouse=nicr
"共享全局剪切板
"set clipboard=unnamed
set incsearch
set ruler
set matchtime=1
set nocompatible
"exrc
set exrc
"set autoread
filetype on
filetype plugin on
filetype indent on
"set ambiwidth=double
"mutt
au BufRead /tmp/mutt-* set tw=72  ""tw=zh
let g:neoterm_autoscroll = 1
""test
let g:indentLine_concealcursor = ''


]]



