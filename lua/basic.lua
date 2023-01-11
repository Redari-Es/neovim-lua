-- print("init basic")

-- basic settings
local set = {
        number = true,
        relativenumber = true,
        showtabline = 2,
        wrap = true, -- default on
        wrapscan = true, -- default on
				tabstop = 2,
        expandtab = true,
        shiftwidth = 2,
        softtabstop = -1,
        smartindent = true,
        autoindent = true,
        cindent = true,
        list = true,
        listchars = "tab:| ,trail:▫",
        cursorline = true,
        cursorcolumn = false,
        -- 
        showmode = true,
        mouse = 'a',
        ignorecase = true,
        smartcase = true,
        cmdheight = 1,
        conceallevel = 0,
        -- concealcursor = " ",
        -- 拼写检查
        spelllang = 'en_us',
	     -- spell = true,
        fileencoding =  'utf-8',
        enc = 'utf-8',
       -- ambw = 'double',
        autoread = true,
        ruler = true,
        matchtime = 1,
        showmatch = true,
        scrolloff = 5,
        --
        ttimeoutlen = 0,
        timeout = false, -- set notimeout, if you use vim-which-key
        title = true,
        tw = 0, --default
        indentexpr="=",
        --
        foldmethod = indent,
        foldlevel = 99,
        foldenable = true,
        -- formatoptions = '-=tc',
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
        colorcolumn = '100',
        updatetime = 1000,
        virtualedit = 'block',
        lazyredraw = true,
        


        
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
"set autoread
filetype on
filetype plugin on 
filetype indent on
"set ambiwidth=double
"mutt
au BufRead /tmp/mutt-* set zh=72  ""tw=zh



]]



