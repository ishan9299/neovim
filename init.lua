local o = vim.o
local wo = vim.wo
local g = vim.g
local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local map = vim.api.nvim_set_keymap


cmd('filetype plugin indent on') -- Filetype flygin on
cmd('syntax enable') -- enable syntax highlighting

-- ++------ GLOBAL OPTIONS ------++
-- Tabstop
o.ts=4
o.sts=4
o.shiftwidth=4 -- spaces for autoindent
o.expandtab = true -- Turn off tabs
-- Set the path to find the file in a project
o.termguicolors = true
o.path = o.path .. '**'
---------------------------
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------------
o.hidden = true -- Switch buffers painlessly
o.lazyredraw = true -- Macros don't show any animation
-- The eob removes ~ at the end of buffer
o.fillchars = 'diff:∙,fold:·,vert:│,eob: '
---------------------------
-- Show tabs and spaces
local listchars = ''
-- listchars = listchars .. 'eol:↲,'
listchars = listchars .. 'tab:»·,'
-- listchars = listchars .. 'space:␣,'
listchars = listchars .. 'trail:•,'
listchars = listchars .. 'extends:☛,'
listchars = listchars .. 'precedes:☚,'
listchars = listchars .. 'conceal:┊,'
listchars = listchars .. 'nbsp:☠'
o.listchars = listchars
---------------------------
-- Show line break
o.showbreak = '↳ '
o.showcmd = false
-- These setting are needed for better completion behaviour and some annoyances
-- c = completion messages
-- W = don't echo "[w]"/"[written]" when writing
-- I = no splash screen
-- a = use abbreviations in messages eg. `[RO]` instead of `[readonly]`
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = vim.o.shortmess .. 'cWIa'
-- statusline
-- 2 = always show it
-- 1 = show only when there is a split
-- 0 = never show it
o.laststatus = 1
-- Scrolling lines starts 5 lines above the last one
o.scrolloff = 8
-- Font used by neovim gui
o.guifont = "agave Nerd Font:h17"
o.hlsearch = false
o.incsearch = true
-- guicursor
o.guicursor = "" -- disabling the guicursor

-- ++------ GLOBAL VARIABLES ------++
-- Set the Leader key
g.mapleader = " "
-- Disable the built-in plugins
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1 -- Do not load tohtml.vim
g.loaded_vimball = 1
g.loaded_justify = 1
g.loaded_cfilter = 1
g.loaded_shellmenu = 1
g.loaded_termdebug = 1
-- undodir
g.undodir = "~/.config/nvim/.undodir"

-- ++------ BUFFER OPTIONS ------++
-- These settings also need to be set as
-- global options don't know why.
bo.ts=4
bo.sts=4
bo.shiftwidth=4 -- spaces for autoindent
bo.expandtab = true -- Turn of tabs
bo.undofile = true

-- ++------ WINDOW OPTIONS ------++
-- Foldmethod
wo.foldmethod='expr'
wo.foldlevel=99
wo.foldexpr='nvim_treesitter#foldexpr()'
-- Enables some characters that show up when using tab and trailing spaces
wo.list=true
-- Cursor line
wo.cursorline = true
wo.colorcolumn = "120"
wo.wrap = false
-- folding
wo.foldmethod = "expr"
wo.foldexpr = "nvim_treesitter#foldexpr()"
wo.lbr = true

-- ++------ KEY BINDINGS ------++
local normal_silent = { silent = true, noremap = true }
local normal_echo = { silent = false, noremap = true }
-- Edit command but more useful
map('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
-- Tabs
map('n' , 'tn' , ':tabnew  <CR>'  , normal_silent)
-- Buffers
map('n' , '<leader>bd'       , ':bd <CR>'                 , normal_silent)
map('n' , '<leader><leader>' , '<C-^>'                    , normal_silent)
map('n' , 'gbp' , ':bp<cr>' , normal_silent)
map('n' , 'gbn' , ':bn<cr>' , normal_silent)
map('n' , '<leader>cd'       , [[:lcd %:p:h<CR>:pwd<CR>]] , normal_silent)
-- Windows
map('n', '<A-h>', '<C-w>h', normal_silent)
map('n', '<A-j>', '<C-w>j', normal_silent)
map('n', '<A-k>', '<C-w>k', normal_silent)
map('n', '<A-l>', '<C-w>l', normal_silent)
-- Resize
map('n', '<C-M-h>', ':vertical resize -2<CR>', normal_silent)
map('n', '<C-M-l>', ':vertical resize +2<CR>', normal_silent)
map('n', '<C-M-j>', ':resize -2<CR>', normal_silent)
map('n', '<C-M-k>', ':resize +2<CR>', normal_silent)
-- Terminal
map('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
map('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
map('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
map('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)

-- ++------ My Functions ------++
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
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_silent)

-- ++------ Plugins ------++

-- BootStrap
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  cmd 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {
        'wbthomason/packer.nvim',
        opt = true,
    }

    -- Pretty colors
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup {
                'html',
                'htmldjango',
                'markdown',
                'css',
                'scss',
                'javascript',
                'php',
                'vim',
                'lua',
                'conf',
                css = {
                    RGB      = true,
                    RRGGBB   = true,
                    names    = true,
                    RRGGBBAA = true,
                    rgb_fn   = true,
                    hsl_fn   = true,
                    css      = true,
                    css_fn   = true,
                },
            }
        end,
    }

    -- Completion
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require'compe'.setup {
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                incomplete_delay = 400;
                allow_prefix_unmatch = false;

                source = {
                    path = true;
                    buffer = true;
                    tags = true;
                    spell = true;
                    vsnip = false;
                    nvim_lsp = false;
                    nvim_lua = true;
                    treesitter = true;
                };
            }
        end
    }

    -- Treesitter
    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     config = function()
    --         require'nvim-treesitter.configs'.setup {
    --             ensure_installed = "maintained",
    --             highlight = {
    --                 enable = true,
    --                 use_languagetree = false,
    --             },
    --         }
    --     end,
    -- }

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }

    use {
        '~/.config/nvim/modus-theme-vim',
        requires = { {'glepnir/galaxyline.nvim'} },
        config = function()
            vim.cmd('colorscheme modus-operandi')
        end,
    }

    use {
        'junegunn/goyo.vim',
        ft = 'markdown'
    }

    use {
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require"toggleterm".setup{
              size = 15,
              open_mapping = [[<M-t>]],
              shade_filetypes = {},
              shade_terminals = false,
              start_in_insert = true,
              persist_size = true,
              direction = 'horizontal',
            }
        end
    }


    use {
        'tikhomirov/vim-glsl'
    }

    use 'tpope/vim-commentary'
    use 'justinmk/vim-dirvish'
    use 'godlygeek/tabular'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-characterize'
    use 'LnL7/vim-nix'
    use 'dstein64/vim-startuptime'
    use 'andreypopp/vim-colors-plain'
    use 'bluz71/vim-moonfly-colors'
    use 'glepnir/zephyr-nvim'
end)
