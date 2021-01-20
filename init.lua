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
o.expandtab = true -- Turn of tabs
-- Set the path to find the file in a project
o.termguicolors = true
o.path = o.path .. '**'
---------------------------
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
-- Show tabs and spaces
local listchars = ''
-- listchars = listchars .. 'eol:↲,'
listchars = listchars .. 'tab:»·,'
-- listchars = listchars .. 'space:␣,'
listchars = listchars .. 'trail:-,'
listchars = listchars .. 'extends:☛,'
listchars = listchars .. 'precedes:☚,'
listchars = listchars .. 'conceal:┊,'
listchars = listchars .. 'nbsp:☠'
o.listchars = listchars
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
o.laststatus = 2
-- Scrolling lines starts 5 lines above the last one
o.scrolloff = 8
-- Font used by neovim gui
o.guifont = "Iosevka Nerd Font Mono:h17"
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
-- Relative line numbers to get normal line number set relative line number as false
wo.relativenumber = true
wo.number = true
-- Enables some characters that show up when using tab and trailing spaces
wo.list=true
-- Cursor line
wo.cursorline = true
wo.colorcolumn = "120"
wo.wrap = false
-- folding
wo.foldmethod = "expr"
wo.foldexpr = "nvim_treesitter#foldexpr()"

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
map('n'  , 'gbp' , ':bp<cr>' , normal_silent)
map('n'  , 'gbn' , ':bn<cr>' , normal_silent)
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
map('t' , '<esc>' , [[<C-\><C-N>]]       , normal_silent)
map('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
map('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
map('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
map('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)
-- For colorscheme and highlight groups
map('n', '<f10>' , [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' <cr>]] , normal_silent)

-- ++------ Autocmds ------++
cmd[[augroup core_autocmds]]
cmd[[autocmd!]]
-- gitcommit
cmd[[autocmd FileType gitcommit setl spell]]
cmd[[autocmd FileType gitcommit setl complete+=kspell]]
-- terminal
cmd[[autocmd TermOpen * setl norelativenumber nonumber]]
cmd[[autocmd TermOpen * startinsert]]
-- makefile
cmd[[autocmd FileType make setl lcs=tab:»· | setl lcs+=space:␣ | setl noexpandtab]]
-- C/C++
cmd[[autocmd FileType c,cpp setlocal colorcolumn=80]]
cmd[[augroup end]]

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

    -- NVIMTree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            local remap = vim.api.nvim_set_keymap
            vim.g.lua_tree_side = 'left' -- left by default
            vim.g.lua_tree_width = 40 -- 30 by default
            vim.g.lua_tree_auto_open            = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
            vim.g.lua_tree_auto_close           = 1 -- 0 by default, closes the tree when it's the last window
            vim.g.lua_tree_quit_on_open         = 1 -- 0 by default, closes the tree when you open a file
            vim.g.lua_tree_follow               = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
            vim.g.lua_tree_indent_markers       = 1 -- 0 by default, this option shows indent markers when folders are open
            vim.g.lua_tree_hide_dotfiles        = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
            vim.g.lua_tree_git_hl               = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
            vim.g.lua_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
            vim.g.lua_tree_tab_open             = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
            vim.g.lua_tree_allow_resize         = 1 -- 0 by default, will not resize the tree when opening a file

            vim.g.lua_tree_icons = {
                default = '',
                symlink = '',
                git = {
                    unstaged  = "✗",
                    staged    = "✓",
                    unmerged  = "",
                    renamed   = "➜",
                    untracked = "★"
                },
                folder = {
                    default = "",
                    open = ""
                }
            }

            --[[
            " You can edit keybindings be defining this variable
            " You don't have to define all keys.
            " NOTE: the 'edit' key will wrap/unwrap a folder and open a file
            let g:lua_tree_bindings = {
            \ 'edit':            ['<CR>', 'o'],
            \ 'edit_vsplit':     '<C-v>',
            \ 'edit_split':      '<C-x>',
            \ 'edit_tab':        '<C-t>',
            \ 'toggle_ignored':  'I',
            \ 'toggle_dotfiles': 'H',
            \ 'refresh':         'R',
            \ 'preview':         '<Tab>',
            \ 'cd':              '<C-]>',
            \ 'create':          'a',
            \ 'remove':          'd',
            \ 'rename':          'r',
            \ 'cut':             'x',
            \ 'copy':            'c',
            \ 'paste':           'p',
            \ 'prev_git_item':   '[c',
            \ 'next_git_item':   ']c',
            \ }
            --]]

            remap('n', '<C-e>', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
        end,
    }

    -- DevIcons
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require'nvim-web-devicons'.setup {
                default = true;
            }
        end,
    }

    -- Completion
    use {
        'nvim-lua/completion-nvim',
        config = function()
            vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
            vim.g.completion_auto_change_source = 1

            vim.g.completion_chain_complete_list = {
                default = {
                    default = {
                        {mode = '<c-n>'},
                        {mode = '<c-p>'},
                    },
                    ['string'] = {
                        {complete_items = {'path'}},
                    },
                    vim = {
                        {mode = 'cmd'},
                    },
                    markdown = {
                        {mode = 'spell'},
                    },
                }
            }

            vim.cmd([[augroup completion_autocmds]])
            vim.cmd([[autocmd!]])
            vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])
            vim.cmd([[augroup END]])
        end,
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "maintained",
                highlight = {
                    enable = true,
                    use_languagetree = false,
                },
            }
        end,
    }

    use {
        'mbbill/undotree',
        config = function()
            local remap = vim.api.nvim_set_keymap
            remap('n', '<F5>', ':UndotreeToggle<cr>', { silent = true, noremap = true })
        end,
    }

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }

    -- Zig
    use {
        'ziglang/zig.vim',
        config = function()
            vim.g.zig_fmt_autosave = 1
        end,
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-project.nvim'}},
        config = function()
            local remap = vim.api.nvim_set_keymap
            local opts = { silent = true, noremap = true }
            remap("n" , "tff" , "<cmd>lua require('telescope.builtin').find_files()<cr>" , opts)
            remap("n" , "tgf" , "<cmd>lua require('telescope.builtin').git_files()<cr>"  , opts)
            remap("n" , "tlg" , "<cmd>lua require('telescope.builtin').live_grep()<cr>"  , opts)
            remap("n" , "tfb" , "<cmd>lua require('telescope.builtin').buffers()<cr>"    , opts)
            remap("n" , "tht" , "<cmd>lua require('telescope.builtin').help_tags()<cr>"  , opts)

            -- Telescope extensions
            require'telescope'.load_extension('project')
            remap("n" , "ttp" , ":lua require('telescope').extensions.project.project{}<cr>"  , opts)
        end,
    }

    use {
        '~/.config/nvim/modus-theme-vim',
        requires = { {'tjdevries/colorbuddy.nvim'}, {'glepnir/galaxyline.nvim'} },
        config = function()
            vim.g.modus_moody_enable = 1
            vim.g.modus_faint_syntax = 1
            require('colorbuddy').colorscheme('modus-vivendi')
        end,
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            local nvim_lsp = require('lspconfig')
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                local opts = { noremap=true, silent=true }
                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

                -- Set some keybinds conditional on server capabilities
                if client.resolved_capabilities.document_formatting then
                    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                elseif client.resolved_capabilities.document_range_formatting then
                    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                end

                -- Set autocommands conditional on server_capabilities
                if client.resolved_capabilities.document_highlight then
                    require('lspconfig').util.nvim_multiline_command [[
                    augroup lsp_document_highlight
                    autocmd!
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                    augroup END
                    ]]
                end
            end

            -- Use a loop to conveniently both setup defined servers
            -- and map buffer local keybindings when the language server attaches
            local servers = {"sumneko_lua" }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup { on_attach = on_attach }
            end

            local system_name
            if vim.fn.has("mac") == 1 then
                system_name = "macOS"
            elseif vim.fn.has("unix") == 1 then
                system_name = "Linux"
            elseif vim.fn.has('win32') == 1 then
                system_name = "Windows"
            else
                print("Unsupported system for sumneko")
            end

            -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
            local sumneko_root_path = 'lspconfig/sumneko_lua/lua-language-server'
            local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

            require'lspconfig'.sumneko_lua.setup {
                cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Setup your lua path
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {'vim', 'use'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                            },
                        },
                    },
                },
            }

        end,
    }

    use {
        'junegunn/goyo.vim',
        ft = 'markdown'
    }

    use 'justinmk/vim-dirvish'
    use 'godlygeek/tabular'
    use 'tpope/vim-surround'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'
    use 'tpope/vim-characterize'
    use 'LnL7/vim-nix'
    use 'mhinz/vim-startify'
    use 'dstein64/vim-startuptime'
    use 'benbusby/vim-earthbound-themes'
end)
