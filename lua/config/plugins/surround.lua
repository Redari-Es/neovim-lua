return {
	-- 'windwp/nvim-autopairs',
	-- 'windwp/nvim-ts-autotag',
	-- 'blackCauldron7/surround.nvim',
	--'numToStr/Comment.nvim'
	-- 'lukas-reineke/indent-blankline.nvim',

	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end
}
