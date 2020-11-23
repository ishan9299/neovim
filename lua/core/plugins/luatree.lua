local vim = vim
vim.cmd('packadd! luatree')

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

vim.api.nvim_set_keymap('n', '<C-e>', ':LuaTreeToggle<cr>', { silent = true, noremap = true })
