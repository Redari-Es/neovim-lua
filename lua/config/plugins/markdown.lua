return {
	{
		-- "instant-markdown/vim-instant-markdown",
		"iamcco/markdown-preview.nvim",
		"iamcco/mathjax-support-for-mkdp",
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_autostart = 0


			vim.cmd([[
			" ===
" === vim-instant-markdown
" === 实时浏览md文件
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
" let g:instant_markdown_browser = "chromium"
let g:instant_markdown_browser = "webs"
"let g:instant_markdown_browser = "surf"
let g:instant_markdown_port = 8880

" ===
" === markdown-preview.nvim
" ===
" normal/insert
" <Plug>MarkdownPreview
" <Plug>MarkdownPreviewStop
" <Plug>MarkdownPreviewToggle
autocmd FileType markdown setlocal expandtab shiftwidth=4
" example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


" ===
" === vim-markdown-toc
" ===
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
"let g:vmt_cycle_list_item_markers = 1

" ==
" == md-img-paste
" ==
let g:mdip_imgdir = 'pic'
let g:mdip_imgname='pic-'
autocmd FileType markdown nnoremap <silent> <C-p> call mdip#MarkdownClipboardImage()<CR>
"===
" === vim-table-mode
" === 自动矫正md表格格式
noremap <LEADER>tm :TableModeToggle<CR>
noremap <LEADER>mp :MarkdownPreview<CR>

"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'



			]])
		end,
	},
}
