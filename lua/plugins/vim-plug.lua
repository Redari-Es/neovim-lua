-- for vim-plug
--
--
--print("init vim-plug")

local Plug = vim.fn['plug#']

vim.call('plug#begin','~/.config/nvim/plugged')

-- List of plugins goes here
-- ...


-- Plug 'welle/targets.vim'
-- Plug 'tpope/vim-surround'
-- Plug 'tpope/vim-repeat'
Plug('scrooloose/nerdtree',{on = 'NERDTreeToggle'})
Plug('junegunn/goyo.vim',{['for'] = 'markdown'})
Plug('RRethy/vim-hexokinase',{['do']='make hexokinase'})
Plug('Yggdroot/LeaderF', { ['do']= './install.sh' })
-- Debugger
Plug ('puremourning/vimspector', {['do']= './install_gadget.py --enable-c --enable-python --enable-go'})
-- coc
-- Plug('neoclide/coc.nvim',{['branch']='release',['do']='yarn install'})
-- Plug('neoclide/coc.nvim',{['branch']='master',['do']='yarn install --frozen-lockfile'})
-- Plug('fatih/vim-go' , {['do']='GoUpdateBinaries'})
Plug('neoclide/coc.nvim',{['branch']='release'})
-- Plug('neoclide/coc.nvim')
Plug('SirVer/ultisnips')
Plug ('iamcco/markdown-preview.nvim', { ['do']= 'cd app && yarn install --frozen-lockfile' })
--Plug('alvan/vim-closetag')

--Plug('theniceboy/vim-deus')
--[[
vim.cmd[[
" vim-gitignore"
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
]]
--]]

-- Plug('nvim-treesitter/nvim-treesitter',{['do'] = ':TSUpdate'})

-- nvim-cmp


-- theme
-- [[Plug('VonHeikemen/rubber-themes.vim', {
--   ['do'] = function()
--      vim.opt.termguicolors = true,
---       vim.cmd('colorcheme rubber')
--       } )

-- Plug 'theniceboy/vim-deus'

vim.call('plug#end')



