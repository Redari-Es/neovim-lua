-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/redaries/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/redaries/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/redaries/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/redaries/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/redaries/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://gitclone.com/github.com/L3MON4D3/LuaSnip"
  },
  ["agit.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/agit.vim",
    url = "https://gitclone.com/github.com/cohama/agit.vim"
  },
  antovim = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/antovim",
    url = "https://gitclone.com/github.com/theniceboy/antovim"
  },
  ["any-jump.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/any-jump.vim",
    url = "https://gitclone.com/github.com/pechorin/any-jump.vim"
  },
  ["argtextobj.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/argtextobj.vim",
    url = "https://gitclone.com/github.com/theniceboy/argtextobj.vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://gitclone.com/github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://gitclone.com/github.com/skywind3000/asynctasks.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://gitclone.com/github.com/jiangmiao/auto-pairs"
  },
  ["bullets.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/bullets.vim",
    url = "https://gitclone.com/github.com/dkarter/bullets.vim"
  },
  ["calendar.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/calendar.vim",
    url = "https://gitclone.com/github.com/itchyny/calendar.vim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://gitclone.com/github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://gitclone.com/github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://gitclone.com/github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://gitclone.com/github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://gitclone.com/github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://gitclone.com/github.com/hrsh7th/cmp-vsnip"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://gitclone.com/github.com/saadparwaiz1/cmp_luasnip"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://gitclone.com/github.com/ctrlpvim/ctrlp.vim"
  },
  ["dart-vim-flutter-layout"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/dart-vim-flutter-layout",
    url = "https://gitclone.com/github.com/tiagofumo/dart-vim-flutter-layout"
  },
  ["eleline.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/eleline.vim",
    url = "https://gitclone.com/github.com/theniceboy/eleline.vim"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/far.vim",
    url = "https://gitclone.com/github.com/brooth/far.vim"
  },
  ["frientdly-snippets"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/frientdly-snippets",
    url = "https://gitclone.com/github.com/rafamadriz/frientdly-snippets"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://gitclone.com/github.com/junegunn/fzf.vim"
  },
  ["git-time-lapse"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/git-time-lapse",
    url = "https://gitclone.com/github.com/junkblocker/git-time-lapse"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://gitclone.com/github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://gitclone.com/github.com/ray-x/guihua.lua"
  },
  ["html5.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/html5.vim",
    url = "https://gitclone.com/github.com/othree/html5.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://gitclone.com/github.com/Yggdroot/indentLine"
  },
  ["jsonc.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/jsonc.vim",
    url = "https://gitclone.com/github.com/neoclide/jsonc.vim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://gitclone.com/github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://gitclone.com/github.com/tami5/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://gitclone.com/github.com/iamcco/markdown-preview.nvim"
  },
  ["mathjax-support-for-mkdp"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/mathjax-support-for-mkdp",
    url = "https://gitclone.com/github.com/iamcco/mathjax-support-for-mkdp"
  },
  ["md-img-paste.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/md-img-paste.vim",
    url = "https://gitclone.com/github.com/ferrine/md-img-paste.vim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://gitclone.com/github.com/scrooloose/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://gitclone.com/github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://gitclone.com/github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://gitclone.com/github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://gitclone.com/github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://gitclone.com/github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://gitclone.com/github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://gitclone.com/github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://gitclone.com/github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://gitclone.com/github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://gitclone.com/github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://gitclone.com/github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://gitclone.com/github.com/roxma/nvim-yarp"
  },
  ["omnisharp-vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/omnisharp-vim",
    url = "https://gitclone.com/github.com/OmniSharp/omnisharp-vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://gitclone.com/github.com/wbthomason/packer.nvim"
  },
  ["pair-maker.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/pair-maker.vim",
    url = "https://gitclone.com/github.com/theniceboy/pair-maker.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://gitclone.com/github.com/nvim-lua/plenary.nvim"
  },
  ["pubspec-assist-nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/pubspec-assist-nvim",
    url = "https://gitclone.com/github.com/f-person/pubspec-assist-nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://gitclone.com/github.com/luochen1990/rainbow"
  },
  rnvimr = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://gitclone.com/github.com/kevinhwang91/rnvimr"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://gitclone.com/github.com/AndrewRadev/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://gitclone.com/github.com/lambdalisue/suda.vim"
  },
  ["swift.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/swift.vim",
    url = "https://gitclone.com/github.com/keith/swift.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://gitclone.com/github.com/godlygeek/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://gitclone.com/github.com/majutsushi/tagbar"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/tcomment_vim",
    url = "https://gitclone.com/github.com/tomtom/tcomment_vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://gitclone.com/github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://gitclone.com/github.com/nvim-telescope/telescope.nvim"
  },
  terminus = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/terminus",
    url = "https://gitclone.com/github.com/wincent/terminus"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://gitclone.com/github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/tmux-complete.vim",
    url = "https://gitclone.com/github.com/wellle/tmux-complete.vim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://gitclone.com/github.com/leafgarland/typescript-vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://gitclone.com/github.com/SirVer/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://gitclone.com/github.com/mbbill/undotree"
  },
  ["vCoolor.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vCoolor.vim",
    url = "https://gitclone.com/github.com/KabbAmine/vCoolor.vim"
  },
  ["vim-addon-mw-utils"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-addon-mw-utils",
    url = "https://gitclone.com/github.com/MarcWeber/vim-addon-mw-utils"
  },
  ["vim-after-object"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-after-object",
    url = "https://gitclone.com/github.com/junegunn/vim-after-object"
  },
  ["vim-anzu"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-anzu",
    url = "https://gitclone.com/github.com/osyo-manga/vim-anzu"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://gitclone.com/github.com/Chiel92/vim-autoformat"
  },
  ["vim-bolt"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-bolt",
    url = "https://gitclone.com/github.com/bpietravalle/vim-bolt"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://gitclone.com/github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-bufferline"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-bufferline",
    url = "https://gitclone.com/github.com/bling/vim-bufferline"
  },
  ["vim-calc"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-calc",
    url = "https://gitclone.com/github.com/theniceboy/vim-calc"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://gitclone.com/github.com/alvan/vim-closetag"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://gitclone.com/github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://gitclone.com/github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-deus"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-deus",
    url = "https://gitclone.com/github.com/Redari-Es/vim-deus"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://gitclone.com/github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://gitclone.com/github.com/junegunn/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://gitclone.com/github.com/easymotion/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://gitclone.com/github.com/voldikss/vim-floaterm"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://gitclone.com/github.com/airblade/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://gitclone.com/github.com/fatih/vim-go"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://gitclone.com/github.com/RRethy/vim-illuminate"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-js",
    url = "https://gitclone.com/github.com/yuezk/vim-js"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-json",
    url = "https://gitclone.com/github.com/elzr/vim-json"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty",
    url = "https://gitclone.com/github.com/MaxMEllon/vim-jsx-pretty"
  },
  ["vim-latex-live-preview"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-latex-live-preview",
    url = "https://gitclone.com/github.com/xuhdev/vim-latex-live-preview"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-markdown-toc",
    url = "https://gitclone.com/github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://gitclone.com/github.com/theniceboy/vim-move"
  },
  ["vim-pdf"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-pdf",
    url = "https://gitclone.com/github.com/makerj/vim-pdf"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://gitclone.com/github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://gitclone.com/github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://gitclone.com/github.com/airblade/vim-rooter"
  },
  ["vim-scrollstatus"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-scrollstatus",
    url = "https://gitclone.com/github.com/ojroques/vim-scrollstatus"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://gitclone.com/github.com/theniceboy/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://gitclone.com/github.com/mhinz/vim-startify"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-styled-components",
    url = "https://gitclone.com/github.com/styled-components/vim-styled-components"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-subversive",
    url = "https://gitclone.com/github.com/svermeulen/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://gitclone.com/github.com/tpope/vim-surround"
  },
  ["vim-swift"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-swift",
    url = "https://gitclone.com/github.com/arzg/vim-swift"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://gitclone.com/github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://gitclone.com/github.com/kana/vim-textobj-user"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://gitclone.com/github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://gitclone.com/github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vue"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-vue",
    url = "https://gitclone.com/github.com/posva/vim-vue"
  },
  ["vim-xtabline"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vim-xtabline",
    url = "https://gitclone.com/github.com/mg979/vim-xtabline"
  },
  vimcodefmt = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vimcodefmt",
    url = "https://gitclone.com/github.com/google/vimcodefmt"
  },
  vimtex = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://gitclone.com/github.com/lervag/vimtex"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://gitclone.com/github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://gitclone.com/github.com/folke/which-key.nvim"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/wildfire.vim",
    url = "https://gitclone.com/github.com/gcmt/wildfire.vim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/yats.vim",
    url = "https://gitclone.com/github.com/HerringtonDarkholme/yats.vim"
  },
  ["zeavim.vim"] = {
    loaded = true,
    path = "/home/redaries/.local/share/nvim/site/pack/packer/start/zeavim.vim",
    url = "https://gitclone.com/github.com/KabbAmine/zeavim.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
