local map = vim.api.nvim_set_keymap
local normal_mode_silent = {silent = true, noremap = true}
local normal_mode_echo = {silent = false, noremap = true}

map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>",
    normal_mode_silent)
map('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    normal_mode_silent)
map('n', '<leader>lb', "<cmd>lua require('telescope.builtin').buffers()<cr>",
    normal_mode_silent)
map('n', '<leader>hh', "<cmd>lua require('telescope.builtin').help_tags()<cr>",
    normal_mode_silent)
map('n', '<leader>tc',
    "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
    normal_mode_silent)
