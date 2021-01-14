local g = vim.g
local remap = vim.api.nvim_set_keymap
local utils = require('utils')

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    -- TODO: Maybe handle windows better?
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end

    local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
    )

    vim.fn.mkdir(directory, 'p')

    local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
    ))

    print(out)
    print("Downloading packer.nvim...")

    return
end


return require('packer').startup(function()
    use {
        'wbthomason/packer.nvim',
        opt = true,
        config = function()
            local compile_packer = {
                packer = {
                    { "BufWritePost", "plugins.lua", "PackerCompile" }
                }
            }
            utils.nvim_create_augroups(compile_packer)
        end
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
            g.lua_tree_side = 'left' -- left by default
            g.lua_tree_width = 40 -- 30 by default
            g.lua_tree_auto_open            = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
            g.lua_tree_auto_close           = 1 -- 0 by default, closes the tree when it's the last window
            g.lua_tree_quit_on_open         = 1 -- 0 by default, closes the tree when you open a file
            g.lua_tree_follow               = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
            g.lua_tree_indent_markers       = 1 -- 0 by default, this option shows indent markers when folders are open
            g.lua_tree_hide_dotfiles        = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
            g.lua_tree_git_hl               = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
            g.lua_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
            g.lua_tree_tab_open             = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
            g.lua_tree_allow_resize         = 1 -- 0 by default, will not resize the tree when opening a file

            g.lua_tree_icons = {
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
            g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
            g.completion_auto_change_source = 1

            g.completion_chain_complete_list = {
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

            local completion_autocmds = {
                completion = {
                    {"BufEnter", "*", "lua require'completion'.on_attach()"}
                }
            }
            utils.nvim_create_augroups(completion_autocmds)

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
            g.zig_fmt_autosave = 1
        end,
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            local opts = { silent = true, noremap = true }
            remap("n" , "tff" , "<cmd>lua require('telescope.builtin').find_files()<cr>" , opts)
            remap("n" , "tgf" , "<cmd>lua require('telescope.builtin').git_files()<cr>"  , opts)
            remap("n" , "tlg" , "<cmd>lua require('telescope.builtin').live_grep()<cr>"  , opts)
            remap("n" , "tfb" , "<cmd>lua require('telescope.builtin').buffers()<cr>"    , opts)
            remap("n" , "tht" , "<cmd>lua require('telescope.builtin').help_tags()<cr>"  , opts)
        end,
    }

    use {
        '~/.config/nvim/modus-theme-vim',
        requires = { {'tjdevries/colorbuddy.nvim'}, {'glepnir/galaxyline.nvim'} },
        config = function()
            g.modus_moody_enable = 1
            g.modus_faint_syntax = 1
            require('colorbuddy').colorscheme('modus-vivendi')
        end,
    }

    use 'junegunn/goyo.vim'
    use 'justinmk/vim-syntax-extra'
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
    use 'benbusby/vim-earthbound-themes' -- moonside theme
end)

