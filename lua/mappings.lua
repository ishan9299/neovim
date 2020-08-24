local nvim_set_keymap = vim.api.nvim_set_keymap
local nvim_set_var = vim.api.nvim_set_var

local opts = { silent = true, noremap = true }

-- Edit command
nvim_set_keymap('n', '<leader>ew', ':e <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
nvim_set_keymap('n', '<leader>es', ':sp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
nvim_set_keymap('n', '<leader>ev', ':vsp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })

-- Buffers
nvim_set_keymap('n', '<leader>bd', ':bd <CR>', opts)
nvim_set_keymap('n', '<leader><leader>', '<C-^>', opts)

-- Resize
nvim_set_keymap('n', 'M-j', ':resize -2<CR>', opts)
nvim_set_keymap('n', 'M-k', ':resize +2<CR>', opts)
nvim_set_keymap('n', 'M-h', ':vertical resize -2<CR>', opts)
nvim_set_keymap('n', 'M-l', ':vertical resize +2<CR>', opts)

-- Windows
nvim_set_keymap('n', '<leader>wh', '<C-w>h', opts)
nvim_set_keymap('n', '<leader>wj', '<C-w>j', opts)
nvim_set_keymap('n', '<leader>wk', '<C-w>k', opts)
nvim_set_keymap('n', '<leader>wl', '<C-w>l', opts)
