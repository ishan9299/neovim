local cmd = vim.cmd
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local o = vim.o
local map = vim.api.nvim_set_keymap
local normal_mode_silent = {silent = true, noremap = true}

cmd('syntax on')

g.mapleader = ' ' -- Space as a leader key
-- Disable builtins plugins
g.loaded_netrwPlugin = 1 -- Disable netrw it has problem with symlinks and I am on nixos
g.loaded_2html_plugin = 1 -- converts lines or the entire buffer to html code
g.loaded_matchit = 1 -- extends matching when using % not really needed though
g.loaded_gzip = 1 -- disable editing compressed files
g.loaded_tarPlugin = 1 -- disable navigating tar files
g.loaded_zipPlugin = 1 -- disable navigating zip files
g.loaded_tutor_mode_plugin = 1 -- disable vim tutor
g.loaded_matchparen = 1 -- disable the match paren plugin
---------------------------
o.laststatus = 1 -- only show the statusline when a split exists
o.hidden = true -- allow us to switch buffers easily
o.termguicolors = true -- 24-bit RGB in terminal
o.guicursor = '' -- disable the line cursor
o.fillchars = 'diff:∙,fold:·,vert:│,eob: ' -- characters used to fill statuslines and seperators
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------
bo.synmaxcol = 500 -- syntax highlighting for 500 colums only
bo.tabstop = 4 -- 4 spaces equals to one tab
bo.shiftwidth = 4 -- number of spaces for each step of autoindent
bo.expandtab = true
bo.textwidth = 120 -- Maximum width of text that is being inserted
wo.foldenable = false


-- Plugins
cmd('packadd! modus-theme-vim')
cmd('colorscheme modus-vivendi') -- set my colorscheme
cmd('packadd! nvim-toggleterm.lua')
require"toggleterm".setup{
    size = 15,
    open_mapping = [[<M-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
}
cmd('packadd! tabular')
cmd('packadd! vim-commentary')
cmd('packadd! vim-dirvish')
cmd('packadd! vim-nix')
-- cmd('packadd! vim-polyglot')
cmd('packadd! vim-repeat')
cmd('packadd! vim-surround')

-- Toggle Line Numbers
function _G.toggleLineNumbers()
    local relativeNumbers = (wo.rnu and wo.nu)
    local numbers = wo.nu
    if (numbers == false) then
        wo.nu = true -- move to normal lineNumbers
    elseif(numbers == true and relativeNumbers == false) then
        wo.rnu = true -- move to relativeNumbers
    elseif(relativeNumbers == true) then
        wo.nu = false -- hide the numbering
        wo.rnu = false -- hide the relative numbering
    end
end
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_mode_silent)

-- Autocmds
-- the disbale tof vim-plygot doesnt seem to slow down the typung in vim
