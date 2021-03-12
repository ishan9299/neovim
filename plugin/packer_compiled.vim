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
    needs_bufread = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["modus-theme-vim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_faint_syntax\6g\bvim\0" },
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
    config = { "\27LJ\2\nñ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\b\rnvim_lua\2\tpath\2\nvsnip\1\ttags\2\vbuffer\2\rnvim_lsp\1\nspell\2\15treesitter\2\1\0\t\15min_length\3\1\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\ndebug\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n∂\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\6\20start_in_insert\2\20shade_terminals\2\17open_mapping\n<M-t>\tsize\3\15\14direction\15horizontal\17persist_size\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\21use_languagetree\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-characterize"
  },
  ["vim-colors-plain"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-colors-plain"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-glsl"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\21use_languagetree\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
-- Config for: modus-theme-vim
try_loadstring("\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_faint_syntax\6g\bvim\0", "config", "modus-theme-vim")
-- Config for: nvim-toggleterm.lua
try_loadstring("\27LJ\2\n∂\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\6\20start_in_insert\2\20shade_terminals\2\17open_mapping\n<M-t>\tsize\3\15\14direction\15horizontal\17persist_size\2\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\nñ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\b\rnvim_lua\2\tpath\2\nvsnip\1\ttags\2\vbuffer\2\rnvim_lsp\1\nspell\2\15treesitter\2\1\0\t\15min_length\3\1\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\ndebug\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
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
