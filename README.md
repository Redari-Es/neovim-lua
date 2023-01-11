# neovim-lua
将原本用vimscript的配置更换成了使用lua的配置，并解决了之前更新后尚未解决的错误


# lua 配置

## 目录

默认配置可使用 

> init.lua
> init.vim (目前还是这个)


在编辑时可以用nvim -u config 来更换配置

方法1
 vim.cmd("set numbers")
方法2
 vim.o.number=true
方法3 
用for 迭代

```lua
vim.opt.shortmess:append 'c'
for k, v in pairs(local name) do
	vim.opt[k]=v
end
```

在init.vim中导入lua包

> lua require('basic')
> lua require ('usermod.settings')




### basic.lua

可查看set all

- number 设置行号
- relativenumber=true 相对行号
- show tabline=2
- wrap=false 不自动换行
- hidden (default)
- conceallevel=0
- cmdheight=1
- tabstop=4
- expandtab=4 for时得是true
- mouse='a' 允许鼠标
- smartindent=true
- autoindent=true
- cursorline=true  用于高亮当前鼠标
- mapleader = ' '  设置为空
- termguicolors=true  更改配置需要打开
- fileencoding='utf-8'
- ignorecase=true 忽略大小写查找时
- smartcase= true 智能大小写


### usermod.settings.lua


### plugins.packer.lua

> sudo pacman -S packer
> git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

 [packer.lua](https://github.com/wbthomason/packer.nvim) 


