local normal_mode_silent = {silent = true, noremap = true}
local normal_mode_echo = {silent = false, noremap = true}

local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local mmv_actions = require 'lir.mmv.actions'
local bookmark_actions = require 'lir.bookmark.actions'

require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
        ['l'] = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['h'] = actions.up,
        ['q'] = actions.quit,
        ['<C-[>'] = actions.quit,

        ['K'] = actions.mkdir,
        ['N'] = actions.newfile,
        ['R'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['D'] = actions.delete,
        ['.'] = actions.toggle_show_hidden,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,

        ['M'] = mmv_actions.mmv,

        ['B'] = bookmark_actions.list,
        ['ba'] = bookmark_actions.add
    },
    hide_cursor = true
}

local b_actions = require 'lir.bookmark.actions'
require'lir.bookmark'.setup {
    bookmark_path = '~/.lir_bookmark',
    mappings = {
        ['l'] = b_actions.edit,
        ['<C-s>'] = b_actions.split,
        ['<C-v>'] = b_actions.vsplit,
        ['<C-t>'] = b_actions.tabedit,
        ['<C-e>'] = b_actions.open_lir,
        ['B'] = b_actions.open_lir,
        ['q'] = b_actions.open_lir
    }
}

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J',
                                ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
                                {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
vim.api.nvim_set_keymap('n', '-', [[:lua require'lir.float'.toggle()<cr>]], normal_mode_silent)
