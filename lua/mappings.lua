local api = vim.api

local opts = { silent = true, noremap = true }

-- Edit command
api.nvim_set_keymap('n', '<leader>ew', ':e <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>es', ':sp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>ev', ':vsp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })

-- Buffers
api.nvim_set_keymap('n', '<leader>bd', ':bd <CR>', opts)
api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', opts)

-- Resize
api.nvim_set_keymap('n', 'M-j', ':resize -2<CR>', opts)
api.nvim_set_keymap('n', 'M-k', ':resize +2<CR>', opts)
api.nvim_set_keymap('n', 'M-h', ':vertical resize -2<CR>', opts)
api.nvim_set_keymap('n', 'M-l', ':vertical resize +2<CR>', opts)

-- Windows
api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', opts)
api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', opts)
api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', opts)
api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', opts)
