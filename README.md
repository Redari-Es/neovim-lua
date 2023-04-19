# neovim-lua
将原本用vimscript的配置更换成了使用lua的配置，并解决了之前更新后尚未解决的错误


## 说明

### branch
- main
- mini

#### main

目前正在使用的分支

#### mini

用于配置最少的功能，以便能在服务器上使用

### bug

- 旧nvim中编辑markdown实时渲染需要手动换行敲两个空格或者在加一行的问题，回车不能自动换行，应该与EOF有关。
- nvim中的字符显示，中文只能显示半边，设置了全宽也没用，待解决, 英语正常
- 回车会自动输入一行![bug](pic/autopair-0)
在编辑lua和一些文件时会出现，最后在[issues](https://github.com/windwp/nvim-autopairs/issues/93) 中找到
![fix](pic/autopair-1)
删掉插件vim-close 另一个同autopairl类似的插件，它在vimscript中也设置了\<CR>

- 准备配置下lazygit ，原本使用的是theniceboy的，现在看能不能自已配置一个颜色出来。

## lua 配置

### 目录

默认配置可使用

| 目录                        | 说明                                                   |
|-----------------------------|--------------------------------------------------------|
| init.lua                    | 配置                                                   |
| init.vim                    | (目前还是这个)只是稍微用下，有空换成上面的             |
| lua/                        | 关于lua的配置存放在这里                                |
| lua/vim-config.lua          | 部分coc                                                |
| lua/plugins/plug-config.vim | 原旧的配置                                             |
| ./nvim-mini                 | 简单化的配置，用于服务器使用（目前ui显示有冲突，待解决 |


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


