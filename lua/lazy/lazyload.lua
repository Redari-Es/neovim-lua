-- 该文件用于优化neovim的性能
--

-- 延迟加载插件
local loaded = {}
function LazyLoad(plugin)
  if loaded[plugin] then
    return
  end
  vim.cmd(string.format('packadd %s', plugin))
  loaded[plugin] = true
end
vim.cmd('autocmd VimEnter * lua LazyLoad("plugin-name")')
-- 将plugin-name替换要延迟加载的插件名称

--[[
--
vim.cmd[[

" 延迟加载插件
autocmd VimEnter * if !exists('g:loaded_plugin') | packadd plugin | let g:loaded_plugin = 1 | endif

" 延迟加载配置
autocmd VimEnter * if !exists('g:loaded_config') | source /path/to/config.vim | let g:loaded_config = 1 | endif
]]
--]]
