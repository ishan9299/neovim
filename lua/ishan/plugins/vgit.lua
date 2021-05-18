require('vgit').setup()

vim.api.nvim_set_keymap('n', '<leader>gh', ':VGit hunk_preview<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gr', ':VGit hunk_reset<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<space>[', ':VGit hunk_up<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<space>]', ':VGit hunk_down<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gd', ':VGit buffer_preview<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gu', ':VGit buffer_reset<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gq', ':VGit hunks_quickfix_list<CR>', {
	noremap = true,
	silent = true,
})
