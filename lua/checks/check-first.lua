-- print("init check")

-- check the env
--

-- check vim-plug
vim.cmd [[
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 
]]

-- check packer
vim.cmd[[
if empty(glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim'))
  silent! exec "!git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
 autocmd vimEnter * PackerSync --sync | source $MYVIMRC
endif
]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- check python
vim.cmd [[
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

let g:python3_host_prog='/usr/bin/python3'
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0 
"source $XDG_CONFIG_HOME/nvim/_machine_specific.vim
]]

