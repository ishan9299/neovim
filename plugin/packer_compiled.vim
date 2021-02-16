" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  kommentary = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0K\0\1\0\1\3\0\0\a/*\a*/\1\2\0\0\6#\bnix\vconfig\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["modus-theme-vim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_moody_enable\6g\bvim\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nä\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\nvsnip\1\nspell\2\rnvim_lsp\1\tpath\2\ttags\2\rnvim_lua\2\vbuffer\2\1\0\t\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n∂\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\6\14direction\15horizontal\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17open_mapping\n<M-t>\tsize\3\15\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nﬂ\5\0\0\a\0\28\0B6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2(\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\0016\1\0\0009\1\3\1)\2\1\0=\2\b\0016\1\0\0009\1\3\1)\2\1\0=\2\t\0016\1\0\0009\1\3\1)\2\1\0=\2\n\0016\1\0\0009\1\3\1)\2\1\0=\2\v\0016\1\0\0009\1\3\1)\2\1\0=\2\f\0016\1\0\0009\1\3\1)\2\1\0=\2\r\0016\1\0\0009\1\3\1'\2\15\0=\2\14\0016\1\0\0009\1\3\1)\2\1\0=\2\16\0016\1\0\0009\1\3\1)\2\1\0=\2\17\0016\1\0\0009\1\3\0015\2\19\0005\3\20\0=\3\21\0025\3\22\0=\3\23\2=\2\18\1\18\1\0\0'\3\24\0'\4\25\0'\5\26\0005\6\27\0B\1\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:NvimTreeToggle<cr>\n<C-e>\6n\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\14untracked\b‚òÖ\runstaged\b‚úó\frenamed\b‚ûú\runmerged\bÓúß\vstaged\b‚úì\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\19lua_tree_icons\26lua_tree_allow_resize\22lua_tree_tab_open\a:~\"lua_tree_root_folder_modifier\20lua_tree_git_hl\27lua_tree_hide_dotfiles\28lua_tree_indent_markers\20lua_tree_follow\26lua_tree_quit_on_open\24lua_tree_auto_close\23lua_tree_auto_open\19lua_tree_width\tleft\18lua_tree_side\6g\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˙\4\0\0\b\0\21\0/6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\2\17\2'\4\18\0B\2\2\1\18\2\0\0'\4\4\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0?:lua require('telescope').extensions.project.project{}<cr>\bttp\fproject\19load_extension\14telescope\frequire:<cmd>lua require('telescope.builtin').help_tags()<cr>\btht8<cmd>lua require('telescope.builtin').buffers()<cr>\btfb:<cmd>lua require('telescope.builtin').live_grep()<cr>\btlg:<cmd>lua require('telescope.builtin').git_files()<cr>\btgf;<cmd>lua require('telescope.builtin').find_files()<cr>\btff\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nv\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:UndotreeToggle<cr>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-characterize"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-earthbound-themes"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-earthbound-themes"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["zig.vim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/zig.vim"
  }
}

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
-- Config for: modus-theme-vim
try_loadstring("\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_moody_enable\6g\bvim\0", "config", "modus-theme-vim")
-- Config for: nvim-web-devicons
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
-- Config for: undotree
try_loadstring("\27LJ\2\nv\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:UndotreeToggle<cr>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "undotree")
-- Config for: zig.vim
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0", "config", "zig.vim")
-- Config for: kommentary
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0K\0\1\0\1\3\0\0\a/*\a*/\1\2\0\0\6#\bnix\vconfig\22kommentary.config\frequire\0", "config", "kommentary")
-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\nﬂ\5\0\0\a\0\28\0B6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2(\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\0016\1\0\0009\1\3\1)\2\1\0=\2\b\0016\1\0\0009\1\3\1)\2\1\0=\2\t\0016\1\0\0009\1\3\1)\2\1\0=\2\n\0016\1\0\0009\1\3\1)\2\1\0=\2\v\0016\1\0\0009\1\3\1)\2\1\0=\2\f\0016\1\0\0009\1\3\1)\2\1\0=\2\r\0016\1\0\0009\1\3\1'\2\15\0=\2\14\0016\1\0\0009\1\3\1)\2\1\0=\2\16\0016\1\0\0009\1\3\1)\2\1\0=\2\17\0016\1\0\0009\1\3\0015\2\19\0005\3\20\0=\3\21\0025\3\22\0=\3\23\2=\2\18\1\18\1\0\0'\3\24\0'\4\25\0'\5\26\0005\6\27\0B\1\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:NvimTreeToggle<cr>\n<C-e>\6n\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\14untracked\b‚òÖ\runstaged\b‚úó\frenamed\b‚ûú\runmerged\bÓúß\vstaged\b‚úì\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\19lua_tree_icons\26lua_tree_allow_resize\22lua_tree_tab_open\a:~\"lua_tree_root_folder_modifier\20lua_tree_git_hl\27lua_tree_hide_dotfiles\28lua_tree_indent_markers\20lua_tree_follow\26lua_tree_quit_on_open\24lua_tree_auto_close\23lua_tree_auto_open\19lua_tree_width\tleft\18lua_tree_side\6g\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-tree.lua")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\nä\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\nvsnip\1\nspell\2\rnvim_lsp\1\tpath\2\ttags\2\rnvim_lua\2\vbuffer\2\1\0\t\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\nsetup\ncompe\frequire\0", "config", "nvim-compe")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n˙\4\0\0\b\0\21\0/6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\2\17\2'\4\18\0B\2\2\1\18\2\0\0'\4\4\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0?:lua require('telescope').extensions.project.project{}<cr>\bttp\fproject\19load_extension\14telescope\frequire:<cmd>lua require('telescope.builtin').help_tags()<cr>\btht8<cmd>lua require('telescope.builtin').buffers()<cr>\btfb:<cmd>lua require('telescope.builtin').live_grep()<cr>\btlg:<cmd>lua require('telescope.builtin').git_files()<cr>\btgf;<cmd>lua require('telescope.builtin').find_files()<cr>\btff\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
-- Config for: nvim-toggleterm.lua
try_loadstring("\27LJ\2\n∂\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\6\14direction\15horizontal\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17open_mapping\n<M-t>\tsize\3\15\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'goyo.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
