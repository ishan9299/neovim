vim.cmd('packadd! barbar')

local normal_silent = { silent = true, noremap = true }

vim.api.nvim_set_keymap('n','<A-,>',':BufferPrevious<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-.>',':BufferNext<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-c>',':BufferClose<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<A-<>',':BufferMovePrevious<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<A->>',':BufferMoveNext<CR>',normal_silent)

vim.api.nvim_set_keymap('n','<A-1>',':BufferGoto 1<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-2>',':BufferGoto 2<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-3>',':BufferGoto 3<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-4>',':BufferGoto 4<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-5>',':BufferGoto 5<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-6>',':BufferGoto 6<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-7>',':BufferGoto 7<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-8>',':BufferGoto 8<CR>', normal_silent)
vim.api.nvim_set_keymap('n','<A-9>',':BufferGoto 9<CR>', normal_silent)

vim.api.nvim_set_keymap('n','<leader>bc',':BufferClose<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<leader>bp',':BufferPick<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<leader>bc',':BufferClose<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<leader>bc',':BufferClose<CR>',normal_silent)

vim.api.nvim_set_keymap('n','<leader>bod',':BufferOrderByDirectory<CR>',normal_silent)
vim.api.nvim_set_keymap('n','<leader>bol',':BufferOrderByLanguage<CR>',normal_silent)

vim.api.nvim_set_keymap('n','<A-c',':BufferClose<CR>',normal_silent)
