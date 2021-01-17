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
            local g = vim.g
            local map = vim.api.nvim_set_keymap
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

            map('n', '<C-e>', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
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
            local g = vim.g
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
            local map = vim.api.nvim_set_keymap
            map('n', '<F5>', ':UndotreeToggle<cr>', { silent = true, noremap = true })
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
            local g = vim.g
            g.zig_fmt_autosave = 1
        end,
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { silent = true, noremap = true }
            map("n" , "tff" , "<cmd>lua require('telescope.builtin').find_files()<cr>" , opts)
            map("n" , "tgf" , "<cmd>lua require('telescope.builtin').git_files()<cr>"  , opts)
            map("n" , "tlg" , "<cmd>lua require('telescope.builtin').live_grep()<cr>"  , opts)
            map("n" , "tfb" , "<cmd>lua require('telescope.builtin').buffers()<cr>"    , opts)
            map("n" , "tht" , "<cmd>lua require('telescope.builtin').help_tags()<cr>"  , opts)
        end,
    }

    use {
        '~/.config/nvim/modus-theme-vim',
        requires = { {'tjdevries/colorbuddy.nvim'}, {'glepnir/galaxyline.nvim'} },
        config = function()
            local g = vim.g
            g.modus_moody_enable = 1
            g.modus_faint_syntax = 1
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
            local servers = { "pyright", "rust_analyzer", "tsserver" }
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

