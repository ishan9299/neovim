local nvim_set_option = vim.api.nvim_set_option
local nvim_get_option = vim.api.nvim_get_option
local nvim_set_var = vim.api.nvim_set_var
local nvim_command = vim.api.nvim_command


-- Relative line numbers
nvim_command('set nu rnu')

-- Colorschemes
-- seoul256 (dark):
--   Range:   233 (darkest) ~ 239 (lightest)
--   Default: 237
nvim_set_var('seoul256_background', 235)
-- seoul256 (light):
--   Range:   252 (darkest) ~ 256 (lightest)
--   Default: 253
--   let g:seoul256_background = 253
nvim_command('colorscheme seoul256')

-- Activate matchit plugin
nvim_command('runtime! macros/matchit.vim')

-- Activate man page plugin
nvim_command('runtime! ftplugin/man.vim')

nvim_command('filetype plugin indent on')
nvim_command('syntax enable')


-- Set the path to find the file in a project
local my_path = nvim_get_option('path')
my_path = my_path .. '**'
nvim_set_option('path',my_path)

-- Set height of status line
nvim_set_option('laststatus',2)

-- Ignore certain files and folders when globbing
local ignore = nvim_get_option('wildignore')
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'

nvim_set_option('wildignore',ignore)

-- Set font for gnvim
nvim_set_option('guifont','Source Code Pro:h15')

-- Winhighlight command
nvim_set_option('winhighlight','NormalNC:ColorColumn')

-- Show unwanted tabs and spaces
nvim_set_option('listchars','tab:▸ ,extends:❯,precedes:❮,nbsp:+')
nvim_set_option('fillchars','fold: ,vert:|')

-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
nvim_set_var('loaded_netrwPlugin',1)

-- Do not load tohtml.vim
nvim_set_var('loaded_2html_plugin',1)
