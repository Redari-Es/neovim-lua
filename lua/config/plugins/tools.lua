return {
	'itchyny/calendar.vim',
	'airblade/vim-gitgutter',
	--database
	'tpope/vim-dadbod',
	'kristijanhusak/vim-dadbod-ui',
	-- Swift
	'keith/swift.vim',
	'arzg/vim-swift',
	-- other
	-- 'google/vimcodefmt', erro
	'posva/vim-vue',
	'leafgarland/typescript-vim',
	'MaxMEllon/vim-jsx-pretty',
	-- Swift
	'keith/swift.vim',
	'arzg/vim-swift',
	'godlygeek/tabular',
	'dkarter/bullets.vim',
	'gcmt/wildfire.vim',        -- in Visual mode, type k' to select all text in '', or type k) k] k} kp
	'junegunn/vim-after-object', -- da= to delete what's after =
	-- 'godlygeek/tabular',-- " ga, or :Tabularize <regex> to align
	--'tpope/vim-capslock'  " Ctrl+L (insert) to toggle capslock
	'easymotion/vim-easymotion',
	'theniceboy/pair-maker.vim',
	'theniceboy/vim-move',
	-- Documentation
	-- 'KabbAmine/zeavim.vim', -- " <LEADER>z to find doc
	-- Other useful utilities
	'lambdalisue/suda.vim', -- " do stuff like :sudowrite
	-- 'TobinPalmer/rayso.nvim',-- 生成漂亮的代码浏览图
	-- 'rmagatti/goto-preview' -- 浮动窗口显示代码引用、定义的预览
	-- 'tomasky/bookmarks.nvim' --给代码加书签
	-- 'johmsalas/text-case.nvim' --命名大小写规则转换
	-- 'gen740/SmoothCursor.nvim', -- 光标移动效果
	'windwp/nvim-ts-autotag',
	-- 'luukvbaal/statuscol.nvim', --增加对代码折叠的条，可以用鼠标操作






	-- config
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.cmd([[colorscheme deus]])
	end,
}
