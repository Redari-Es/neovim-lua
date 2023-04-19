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
      'L3MON4D3/LuaSnip',
      -- treesitter config
      use( "nvim-treesitter/nvim-treesitter",{['do']=':TSUpdate'})

      use{
        'tami5/lspsaga.nvim',
        config = function()
          require('lspsaga').setup{}
        end
      }
      -- go
      use {
        'ray-x/go.nvim',
        'ray-x/guihua.lua',
      }
      use(
      'RRethy/vim-hexokinase',{['do']='maker hexokinase'}
      )
      -- tree
      use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        -- config = function() require'nvim-tree'.setup {} end
      }

      use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

      -- telecope
      use {
        'nvim-telescope/telescope-media-files.nvim',
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
      use {
        "windwp/nvim-autopairs",
        config = function() require().startup {} end}
        use{
          'windwp/nvim-ts-autotag',
          'blackCauldron7/surround.nvim',
        }
        -- vim-plug move to packer
        use{
          'tpope/vim-surround',
          'jiangmiao/auto-pairs',
          'tpope/vim-repeat',
          'junegunn/vim-easy-align',
          'AndrewRadev/splitjoin.vim',
          'junkblocker/git-time-lapse',
          'KabbAmine/vCoolor.vim',
          'theniceboy/eleline.vim',
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
          'jaxbot/browserlink.vim',
          'posva/vim-vue',
          'leafgarland/typescript-vim',
          'MaxMEllon/vim-jsx-pretty',
          -- Swift
          'keith/swift.vim',
          'arzg/vim-swift',
          'dkarter/bullets.vim',
          'godlygeek/tabular',
          'ferrine/md-img-paste.vim',
          'mg979/vim-visual-multi',
          'tomtom/tcomment_vim', -- in <space>cn to comment a line
          'theniceboy/antovim', -- gs to switch
          --'tpope/vim-surround', -- type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
          'gcmt/wildfire.vim', -- in Visual mode, type k' to select all text in '', or type k) k] k} kp
          'junegunn/vim-after-object', -- da= to delete what's after =
          'easymotion/vim-easymotion',
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
          'junegunn/goyo.vim',
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
          -- Dependencies
          'MarcWeber/vim-addon-mw-utils',
          'kana/vim-textobj-user',
          'roxma/nvim-yarp',
          -- Bookmarks
          -- 'kshenoy/vim-signature'
          'MattesGroeger/vim-bookmarks',
          --Tex
          -- CSharp
          use ('ctrlpvim/ctrlp.vim' , { ['for']= 'cs', 'vim-plug' }),
          -- HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
          use ('yuezk/vim-js', { ['for']='vim-plug', 'php', 'html', 'javascript', 'css', 'less','vue'}),
          use('styled-components/vim-styled-components', { ['branch']= 'main' }),
          'pantharshit00/vim-prisma',
          -- Go
          --use('fatih/vim-go' , {['do']='GoUpdateBinaries' }),
          -- PHP
          use('Vimjas/vim-python-pep8-indent', { ['for'] ='python', 'vim-plug' }),
          -- Flutter
          --'theniceboy/dart-vim-plugin',
          --'thosakwe/vim-flutter',
          use('f-person/pubspec-assist-nvim', {['for']='pubspec.yaml'}),
          -- Markdown
          use('suan/vim-instant-markdown', {['for']='markdown'}),
          use('dhruvasagar/vim-table-mode', { ['on']='TableModeToggle', ['for']='text', 'markdown', 'vim-plug' }),
          use('mzlogin/vim-markdown-toc', { ['for']='gitignore', 'markdown', 'vim-plug' }),
          -- Find & Replace
          use('brooth/far.vim', { ['on']= 'F', 'Far', 'Fardo' }),
          --  use('neoclide/coc.nvim',{['branch']='release'})
          ----Plug('neoclide/coc.nvim',{['branch']='release'})
          --old-vim-plug-end
        }

        --endingplug
        if packer_bootstrap then
          require('packer',sync())
        end
      end)
