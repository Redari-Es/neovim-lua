-- plugins
-- packer
-- print("init packer")
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])
require('packer').init({
  git = {
    default_url_format = 'https://gitclone.com/github.com/%s'}
    -- default_url_format = 'https://github.com/%s'}
    -- default_url_format = 'https://github.com/%s'}
  })
  --
  -- local use = require('packer').use
  return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' -- package manager
    -- lsp
    use {

      "williamboman/nvim-lsp-installer",
      'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      -- For vsnip users
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      -- snip
      'rafamadriz/frientdly-snippets',
      -- For luasnip users
      'L3MON4D3/LuaSnip',
      -- 'saadparwaiz1/cmp_luasnip'
      'onsails/lspkind.nvim',

      -- use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})-- Snippets plugin
      --'kyazdani42/nvim-tree.lua'--LuaSnip',-- Snippets plugin
    }
    -- tree
    --
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      -- config = function() require'nvim-tree'.setup {} end
    }

    -- treesitter config
    use( "nvim-treesitter/nvim-treesitter",{['do']=':TSUpdate'})


    use{
      'tami5/lspsaga.nvim',
      config = function()
        require('lspsaga').setup{}
      end
    }
    --go
    use {
      'ray-x/go.nvim',
      'ray-x/guihua.lua',
      config = function()
        require("go").setup()
      end,
      ft={'go','gomod'},
    }
    -- gotesting
    --   use{
    --     "ray-x/go.nvim",
    --     requires = {  -- optional packages
    --     "ray-x/guihua.lua",
    --     "neovim/nvim-lspconfig",
    --     "nvim-treesitter/nvim-treesitter",
    --   },
    --   config = function()
    --     require("go").setup()
    --   end,
    --   event = {"CmdlineEnter"},
    --   ft = {"go", 'gomod'},
    --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    -- }


    -- bug
    --use 'rstacruz/vim-closer'
    -- use { 'nvim-treesiteer/playground'}

    -- markdown
    -- install without yarn or npm
    -- Markdown
    -- use('suan/vim-instant-markdown', {['for']='markdown'}),
    use('dhruvasagar/vim-table-mode', { ['on']='TableModeToggle', ['for']='text', 'markdown', 'vim-plug' })
    use('mzlogin/vim-markdown-toc', { ['for']='gitignore', 'markdown', 'vim-plug' })
    --
    use{'iamcco/mathjax-support-for-mkdp'}

    use {'iamcco/markdown-preview.nvim'}
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    --

    -- telecope
    use {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'},{"kdheepak/lazygit.nvim"} },
      config = function()
        require("telescope").load_extension("lazygit")
      end,
    }
    use 'folke/which-key.nvim'
    use {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text'
    }
    use{
      use{
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup{} end
      },
      'windwp/nvim-ts-autotag',
      'blackCauldron7/surround.nvim',
      --'numToStr/Comment.nvim'
      -- 'lukas-reineke/indent-blankline.nvim',
    }

    -- vim-plug move to packer
    use{
      --database
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-ui',
      'tpope/vim-surround',
      'voldikss/vim-floaterm',
      --java
      'mfussenegger/nvim-jdtls',
      'jiangmiao/auto-pairs',
      'tpope/vim-repeat',
      'junegunn/vim-easy-align',
      'tiagofumo/dart-vim-flutter-layout',
      'AndrewRadev/splitjoin.vim',
      'junkblocker/git-time-lapse',
      'KabbAmine/vCoolor.vim',
      'theniceboy/eleline.vim',
      --'theniceboy/vim-deus',
      'Redari-Es/vim-deus',
      'theniceboy/vim-calc',
      --  'theniceboy/vim-gitignore',
      'ojroques/vim-scrollstatus',
      'bling/vim-bufferline',
      'bpietravalle/vim-bolt',
      'RRethy/vim-illuminate',
      --'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
      'scrooloose/nerdcommenter',
      'junegunn/fzf.vim',
      'kevinhwang91/rnvimr',
      'airblade/vim-rooter',
      -- 'Redari-Es/any-jump.vim',
      'pechorin/any-jump.vim',
      -- Taglist
      'liuchengxu/vista.vim',
      --tagbar
      'majutsushi/tagbar',

      --auto complete
      'wellle/tmux-complete.vim',
      --snippets
      'SirVer/ultisnips',
      'theniceboy/vim-snippets',
      -- undo tree
      'mbbill/undotree',
      -- Git
      --'tpope-vim-fugitive',
      'airblade/vim-gitgutter',
      'cohama/agit.vim',
      --AutoFormat
      'Chiel92/vim-autoformat',
      'google/vimcodefmt',
      'OmniSharp/omnisharp-vim',
      'elzr/vim-json',
      'neoclide/jsonc.vim',
      'othree/html5.vim',
      'alvan/vim-closetag',
      'HerringtonDarkholme/yats.vim',
      --'jaxbot/browserlink.vim',
      'posva/vim-vue',
      'leafgarland/typescript-vim',
      'MaxMEllon/vim-jsx-pretty',
      -- Swift
      'keith/swift.vim',
      'arzg/vim-swift',
      --'google/vim-maktaba',
      'dkarter/bullets.vim',
      --'hotoo/pangu.vim',
      'godlygeek/tabular',
      'ferrine/md-img-paste.vim',
      --'plasticboy/vim-markdown',
      -- Other filetypes
      --use('jceb/vim-orgmode', {['for']='vim-plug', 'org'}),
      --Editor Enhancement
      'mg979/vim-visual-multi',
      'tomtom/tcomment_vim', -- in <space>cn to comment a line
      'theniceboy/antovim', -- gs to switch
      --'tpope/vim-surround', -- type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
      'gcmt/wildfire.vim', -- in Visual mode, type k' to select all text in '', or type k) k] k} kp
      'junegunn/vim-after-object', -- da= to delete what's after =
      -- 'godlygeek/tabular',-- " ga, or :Tabularize <regex> to align
      --'tpope/vim-capslock'  " Ctrl+L (insert) to toggle capslock
      'easymotion/vim-easymotion',
      --'Konfekt/FastFold'
      --'junegunn/vim-peekaboo'
      -- 'wellle/context.vim'
      'svermeulen/vim-subversive',
      'theniceboy/argtextobj.vim',
      'rhysd/clever-f.vim',
      --'AndrewRadev/splitjoin.vim',
      'theniceboy/pair-maker.vim',
      'theniceboy/vim-move',
      -- Input Method Autoswitch
      'Yggdroot/indentLine',
      -- 'rlue/vim-barbaric' " slowing down vim-multiple-cursors
      'osyo-manga/vim-anzu',
      -- For general writing
      -- 'junegunn/goyo.vim',
      -- 'reedes/vim-wordy'
      -- 'ron89/thesaurus_query.vim'
      -- Documentation
      'KabbAmine/zeavim.vim',-- " <LEADER>z to find doc
      -- Mini Vim-APP
      --"Plug 'liuchengxu/vim-clap'
      --"Plug 'jceb/vim-orgmode'
      'mhinz/vim-startify',
      'skywind3000/asynctasks.vim',
      'skywind3000/asyncrun.vim',
      --Vim Applications
      'itchyny/calendar.vim',
      -- Other visual enhancement
      'luochen1990/rainbow',
      'mg979/vim-xtabline',
      'ryanoasis/vim-devicons',
      'wincent/terminus',
      -- Other useful utilities
      'lambdalisue/suda.vim',-- " do stuff like :sudowrite
      'makerj/vim-pdf',
      -- 'xolox/vim-session'
      -- 'xolox/vim-misc' " vim-session dep

      -- Dependencies
      'MarcWeber/vim-addon-mw-utils',
      'kana/vim-textobj-user',
      'roxma/nvim-yarp',
      -- Bookmarks
      -- 'kshenoy/vim-signature'
      'MattesGroeger/vim-bookmarks',
      --Tex
      'lervag/vimtex',
      use ('xuhdev/vim-latex-live-preview', {['for']= 'tex'}),
      use ('KeitaNakamura/tex-conceal.vim', {['for']='tex'}),
      -- 'wjakob/wjakob.vim',
      -- CSharp
      use ('ctrlpvim/ctrlp.vim' , { ['for']= 'cs', 'vim-plug' }),
      -- HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
      use ('yuezk/vim-js', { ['for']='vim-plug', 'php', 'html', 'javascript', 'css', 'less','vue'}),
      use('styled-components/vim-styled-components', { ['branch']= 'main' }),
      'pantharshit00/vim-prisma',
      -- Go
      use('fatih/vim-go' , {['do']='GoUpdateBinaries' }),
      -- PHP
      use('Vimjas/vim-python-pep8-indent', { ['for'] ='python', 'vim-plug' }),
      -- Flutter
      --'theniceboy/dart-vim-plugin',
      --'thosakwe/vim-flutter',
      use('f-person/pubspec-assist-nvim', {['for']='pubspec.yaml'}),
      -- Find & Replace
      use('brooth/far.vim', { ['on']= 'F', 'Far', 'Fardo' }),

      ----Plug('neoclide/coc.nvim',{['branch']='release'})

      --old-vim-plug-end
    }


    -- Genreal Highlighter
    --[[
    " 1
    "Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    "2
    Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'RRethy/vim-illuminate'

    --
    -- 'arzg/vim-colors-xcode',
    'liuchengxu/space-vim-theme'
    'morhetz/gruvbox'
    'ayu-theme/ayu-vim'
    'rakr/vim-one'
    'mhartington/oceanic-next'
    'kristijanhusak/vim-hybrid-material'
    'ajmwagar/vim-deus'
    'arzg/vim-colors-xcode'
    --]]



    --endingplug
    if packer_bootstrap then
      require('packer',sync())
    end
  end
  )
