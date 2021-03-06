-- -------- Plugins ----------
vim.cmd('packadd! neorg')
vim.cmd('packadd! tabular')
vim.cmd('packadd! vim-commentary')
-- vim.cmd('packadd! kommentary')
vim.cmd('packadd! plenary')
vim.cmd('packadd! popup')
vim.cmd('packadd! nvim-web-devicons')
vim.cmd('packadd! lir')
vim.cmd('packadd! lir-bookmarks')
vim.cmd('packadd! lir-mmv')
vim.cmd('packadd! vim-repeat')
vim.cmd('packadd! vim-surround')
vim.cmd('packadd! vim-startuptime')
vim.cmd('packadd! nvim-web-devicons')
-- vim.cmd('packadd! galaxyline')
-- vim.cmd('packadd! glow')
vim.cmd('packadd! fterm')
vim.cmd('packadd! lspconfig')
vim.cmd('packadd! nvim-telescope')
vim.cmd('packadd! nvim-compe')
vim.cmd('packadd! truezen')
vim.cmd('packadd! expressline')
-- vim.cmd('packadd! vgit') -- this is neat but it is slowww.
-- vim.cmd('packadd! rooter')
-- vim.cmd('packadd! gitsigns')
vim.cmd('packadd! todo-comments')
vim.cmd('packadd! vim-hexokinase')
vim.cmd('packadd! neogit')

-- ------- ColorsScheme -------
vim.cmd('packadd! lush')
vim.cmd('packadd! modus-theme-vim')
vim.cmd('packadd! nvim-solarized-lua')
-- vim.cmd('packadd solarized8')
vim.cmd('packadd! zephyr-nvim')
vim.cmd('packadd! nvcode-color-scheme')
vim.cmd('packadd! tokyonight')
vim.cmd('packadd! one-nvim')
vim.cmd('packadd! melange')
vim.cmd('packadd! gruvbox')
vim.cmd('packadd! nord')
vim.cmd('packadd! ayu')

----- Syntax Plugins ------
vim.cmd('packadd! vim-nix')
vim.cmd('packadd! vim-fish')
vim.cmd('packadd! zig')
-- vim.cmd('packadd! vim-cpp-modern')
-- vim.cmd('packadd! vim-cmake-syntax')
vim.cmd('packadd! vim-glsl')
-- vim.cmd('packadd! vim-go')
-- vim.cmd('packadd! BetterLua')
vim.cmd('packadd! nvim-treesitter')
vim.cmd('packadd! playground')
-- vim.cmd('packadd! vim-startify')
vim.cmd('packadd! which-key')

require('ishan.plugins')
