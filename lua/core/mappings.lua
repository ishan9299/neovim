local api = vim.api
local M = {}

function M.setup()
local normal_silent = { silent = true, noremap = true }
local normal_echo = { silent = false, noremap = true }

api.nvim_set_keymap('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
api.nvim_set_keymap('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
api.nvim_set_keymap('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
api.nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)

-- Tabs
api.nvim_set_keymap('n' , 'tn' , ':tabnew  <CR>'  , normal_silent)
api.nvim_set_keymap('n' , 'tj' , ':tabprevious <CR>'  , normal_silent)
api.nvim_set_keymap('n' , 'tk' , ':tabnext <CR>'  , normal_silent)

-- Buffers
api.nvim_set_keymap('n' , '<leader>bd'       , ':bd <CR>'                 , normal_silent)
api.nvim_set_keymap('n' , '<leader><leader>' , '<C-^>'                    , normal_silent)
api.nvim_set_keymap('n'  , '[b' , ':bp<cr>' , normal_silent)
api.nvim_set_keymap('n'  , ']b' , ':bn<cr>' , normal_silent)
api.nvim_set_keymap('n' , '<leader>cd'       , [[:lcd %:p:h<CR>:pwd<CR>]] , normal_silent)

-- Windows
api.nvim_set_keymap('n', '<A-h>', '<C-w>h', normal_silent)
api.nvim_set_keymap('n', '<A-j>', '<C-w>j', normal_silent)
api.nvim_set_keymap('n', '<A-k>', '<C-w>k', normal_silent)
api.nvim_set_keymap('n', '<A-l>', '<C-w>l', normal_silent)


-- Terminal
api.nvim_set_keymap('t' , '<esc>' , [[<C-\><C-N>]]       , normal_silent)
api.nvim_set_keymap('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
api.nvim_set_keymap('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
api.nvim_set_keymap('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
api.nvim_set_keymap('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)

-- For colorscheme and highlight groups
api.nvim_set_keymap('n', '<f10>' , [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' <cr>]] , normal_silent)
api.nvim_set_keymap('n', '<f5>'  , [[:call v:lua.require('utils').toggle_colorschemes() <cr>]] , normal_silent)
end

return M
