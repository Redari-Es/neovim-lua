
--[[ vima 
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
--]]
-- lua
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--

local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
telescope.setup({
    defaults = {
        borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
        mappings = {
            n = {
                ["<M-p>"] = action_layout.toggle_preview
            },
            i = {
                ["<M-p>"] = action_layout.toggle_preview
            },
        },
    },
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
        },
    },
})
telescope.load_extension("media_files")

local opt = { noremap = true, silent = true }
-- mappings
vim.keymap.set("n", "<Leader>sf", require("telescope.builtin").find_files, opt)
vim.keymap.set("n", "<Leader>sg", require("telescope.builtin").live_grep, opt)
vim.keymap.set("n", "<Leader>sb", require("telescope.builtin").buffers, opt)
vim.keymap.set("n", "<Leader>sh", require("telescope.builtin").help_tags, opt)
vim.keymap.set("n", "<Leader>sp", require("telescope").extensions.media_files.media_files, opt)
