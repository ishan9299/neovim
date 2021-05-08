local map = vim.api.nvim_set_keymap
local normal_mode_silent = {silent = true, noremap = true}
local normal_mode_echo = {silent = false, noremap = true}

require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})
map('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>', normal_mode_silent)
map('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', normal_mode_silent)
