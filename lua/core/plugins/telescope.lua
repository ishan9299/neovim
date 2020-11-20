local vim = vim
vim.cmd('packadd! plenary')
vim.cmd('packadd! popup')
vim.cmd('packadd! telescope')

local normal_silent = { silent = true, noremap = true }

vim.api.nvim_set_keymap('n' , '<leader>ff' , [[<cmd>lua require('telescope.builtin').find_files() <cr>]] , normal_silent)
vim.api.nvim_set_keymap('n' , '<leader>fg' , [[<cmd>lua require('telescope.builtin').live_grep() <cr>]]  , normal_silent)
vim.api.nvim_set_keymap('n' , '<leader>fb' , [[<cmd>lua require('telescope.builtin').buffers() <cr>]]    , normal_silent)
