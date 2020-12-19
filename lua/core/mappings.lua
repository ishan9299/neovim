local api = vim.api
local remap = api.nvim_set_keymap
local M = {}

function M.setup()
local normal_silent = { silent = true, noremap = true }
local normal_echo = { silent = false, noremap = true }

remap('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
remap('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
remap('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
remap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)

-- Tabs
remap('n' , 'tn' , ':tabnew  <CR>'  , normal_silent)
remap('n' , 'tj' , ':tabprevious <CR>'  , normal_silent)
remap('n' , 'tk' , ':tabnext <CR>'  , normal_silent)

-- Buffers
remap('n' , '<leader>bd'       , ':bd <CR>'                 , normal_silent)
remap('n' , '<leader><leader>' , '<C-^>'                    , normal_silent)
remap('n'  , 'gbp' , ':bp<cr>' , normal_silent)
remap('n'  , 'gbn' , ':bn<cr>' , normal_silent)
remap('n' , '<leader>cd'       , [[:lcd %:p:h<CR>:pwd<CR>]] , normal_silent)

-- Windows
remap('n', '<A-h>', '<C-w>h', normal_silent)
remap('n', '<A-j>', '<C-w>j', normal_silent)
remap('n', '<A-k>', '<C-w>k', normal_silent)
remap('n', '<A-l>', '<C-w>l', normal_silent)

-- Resize
remap('n', '<C-M-h>', ':vertical resize -2<CR>', normal_silent)
remap('n', '<C-M-l>', ':vertical resize +2<CR>', normal_silent)
remap('n', '<C-M-j>', ':resize -2<CR>', normal_silent)
remap('n', '<C-M-k>', ':resize +2<CR>', normal_silent)


-- Terminal
remap('t' , '<esc>' , [[<C-\><C-N>]]       , normal_silent)
remap('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
remap('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
remap('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
remap('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)

-- For colorscheme and highlight groups
remap('n', '<f10>' , [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' <cr>]] , normal_silent)
end

return M
